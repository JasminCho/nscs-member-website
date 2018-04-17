
class Calendar<ApplicationRecord
	self.primary_key = :calendar_id
	has_many :events
	attr_accessor :client

	def initialize(current_user)
		#Call the parent initialize.
		#Don't override completely.
		super()
		configure_client(current_user)
		response = @client.execute(api_method: @service.calendars.get,
			parameters: {'calendarId' => ENV['NSCS_Calendar_ID']})
		#response = JSON.parse(response.body)
		self.name="NSCS_Calendar"
		#self.name=response["summary"]
		self.calendar_id=ENV['NSCS_Calendar_ID']
		
	end

	def configure_client(current_user)
		
		@client = Google::APIClient.new
		authorization = Google::APIClient::ClientSecrets.new (
			{"web" => {
				"access_token" => current_user.oauth_token,
				"refresh_token" => current_user.refresh_token,
				"client_id" => ENV['GOOGLE_CLIENT_ID'],
				"client_secret"=> ENV['GOOGLE_CLIENT_SECRET']
			}
			})

		@client.authorization = authorization.to_authorization
		@client.authorization.refresh!
		@service = @client.discovered_api('calendar', 'v3')
		#	@calendar = ENV['NSCS_Calendar_ID']
	end

	def fetch_info
		calendar = Hash.new
	end


	#WARNING There is no distingish between not a role and nil?
	#WARNING There is no confirmation it is  the owner of the calendar.
	def is_admin?(email)
		if(!@client.nil?)
			response = @client.execute(api_method: @service.acl.list,
						   parameters: {'calendarId' =>ENV['NSCS_Calendar_ID']})
			response.items.each do |e|
				if e.scope.value == email
					if e.role == "writer" || e.role == "owner"
						return true
					end
				else
					return false
				end
			end
		end
	end


	#WARNING Needs to call is_admin? before, so it can check client.nill?	
	def modify_roles(email, role)
		response = @client.execute(api_method: @service.acl.insert,
					   parameters: {'calendarId' => ENV['NSCS_Calendar_ID']}, body: JSON.dump({role: role, scope: {type: "user", "value": email}}))
	end


	#TODO
	def add_user()
		if(!@lcient.nil?)
		end
	end

	#Gets all the calendars of a User. Probably unused.
	def get_calendar_list()
		if(!@client.nil?)
			response = @client.execute(api_method: @service.calendar_list.list)
			calendars = JSON.parse(response.body)
		else
			puts "Client No Calendar boi"
		end
	end

	def list_events()

		response = @client.execute(api_method: @service.events.list,
					   parameters: {'calendarId' => ENV['NSCS_Calendar_ID']})
		# max_results: 10,
		# single_events: true,
		# order_by: 'startTime',
		# time_min: Time.now.iso8601))
		calendars = JSON.parse(response.body)


	end

	#Warning: This assumes that all events will happen in College Station
	#Check for time format.
	def is_valid_time?(timeBegin, timeEnd)

		#zone = Timezone.get('America/Chicago').now.zone

		#freebusy method only responds to a couple of months (maybe <=3)
		response = @client.execute(api_method: @service.freebusy.query,
					   body: JSON.dump({
			 timeMin: timeBegin,
			 timeMax: timeEnd,
			 timeZone: 'America/Chicago',
			 items:[ id: ENV['NSCS_Calendar_ID']]
			 }),
			 headers: {'Content-Type' => 'application/json'})
		
		events = JSON.parse(response.body)
		debugger
		#TODO iterate over events.
	end

	#TODO parse the time
	#Warning: This assumes that all events will happen in College Station.
	def insert_event(event)
		
		start_date =timeparse(event[:start_date], event[:start_time])
		end_date =timeparse(event[:end_date], event[:end_time])
		#is_valid_time?(start_date,end_date)

		event =  {
		summary: event[:title],
	  	location: event[:location],
	  	description:  event[:description],
	  	start: {
		dateTime: start_date,
	    	timeZone: 'America/Chicago'
	  	},
	  	end: {
		dateTime: end_date,
	    	timeZone: 'America/Chicago'
	  	},
	 	recurrence: [
	    	#'RRULE:FREQ=DAILY;COUNT=1'
	  	],
	  	attendees: [
	   	# {'email': 'ggregar@gmail.com'}
	   	# {email: 'sbrin@example.com'},
	  	],
	  	reminders: {
	    	useDefault: 'true',
	    	#overrides: [
	      	#{method: 'email', minutes: '10'}
	    #  	{method' => 'popup', 'minutes: 10},
	    	#]
	  	}
		}
		response = @client.execute(api_method: @service.events.insert,
		parameters: {'calendarId' => ENV['NSCS_Calendar_ID']}, body: JSON.dump(event), headers: {'Content-Type' => 'application/json'})
		
		#Todo Method For checking dropped.
		response = JSON.parse(response.body)
		puts "It got created?"
		
		debugger
		event[:event_id]= response["id"]
		event[:creator_name]= response["creator"]["displayName"]
		event[:creator_email]= response["creator"]["email"]
		event[:start_time]= DateTime.parse(response["start"]["dateTime"]).strftime('%I:%M:%S %p')
		event[:end_time]= DateTime.parse(response["end"]["dateTime"]).strftime('%I:%M:%S %p')
		
	end

	def update_event(event)
		start_date =timeparse(event[:start_date], event[:start_time])
		end_date =timeparse(event[:end_date], event[:end_time])

		updated_event =  {
			summary: event[:title],
			  location: event[:location],
			  description:  event[:description],
			  start: {
			dateTime: start_date,
				timeZone: 'America/Chicago'
			  },
			  end: {
			dateTime: end_date,
				timeZone: 'America/Chicago'
			  },
			  reminders: {
				useDefault: 'true',
				#overrides: [
				  #{method: 'email', minutes: '10'}
			#  	{method' => 'popup', 'minutes: 10},
				#]
			  }
			}
		response = @client.execute(api_method: @service.events.update,
		parameters: {'calendarId' => ENV['NSCS_Calendar_ID'], 'eventId' => event[:event_id]}, body: JSON.dump(updated_event), headers: {'Content-Type' => 'application/json'})
		response = JSON.parse(response.body)
		#TODO check method if the packet is dropped.

		event[:event_id]= response["id"]
		event[:creator_name]= response["creator"]["displayName"]
		event[:creator_email]= response["creator"]["email"]
		event[:start_time]= DateTime.parse(response["start"]["dateTime"]).strftime('%I:%M:%S %p')
		event[:end_time]= DateTime.parse(response["end"]["dateTime"]).strftime('%I:%M:%S %p')
	end

	def delete_event(event)
		response = @client.execute(api_method: @service.events.delete,
			parameters: {'calendarId' => ENV['NSCS_Calendar_ID'], 'eventId' => event[:event_id]})		
	end
		
	def timeparse(date,time)

		dt = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, Time.now.zone)
	
		return dt.rfc3339
	end

	def from_calendar(event,response)
		event[:title] = response["summary"]
		event[:description] = response["description"]
		event[:location] = response["location"]
		event[:event_id]= response["id"]
		event[:creator_name]= response["creator"]["displayName"]
		event[:creator_email]= response["creator"]["email"]
		event[:start_time]= DateTime.parse(response["start"]["dateTime"]).strftime('%I:%M:%S %p')
		event[:end_time]= DateTime.parse(response["end"]["dateTime"]).strftime('%I:%M:%S %p')
		event[:start_date] =  DateTime.parse(response["start"]["dateTime"]).to_s.to_date
		event[:end_date]= DateTime.parse(response["end"]["dateTime"]).to_s.to_date

	end
end

