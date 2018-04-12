
class Calendar<ApplicationRecord
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
		#debugger
	end

	def configure_client(current_user)
		
		@client = Google::APIClient.new
		authorization = Google::APIClient::ClientSecrets.new (
			{"web" => {
				"access_token" => current_user.oauth_token,
				"refresh_token" => current_user.refresh_token,
				"client_id" => ENV['google_client_id'],
				"client_secret"=> ENV['google_client_secret']
			}
			})

		@client.authorization = authorization.to_authorization
		#	@client.authorization.refresh!
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

		zone = Timezone.get('America/Chicago').now.zone
		#freebusy method only responds to a couple of months (maybe <=3)
		response = @client.execute(api_method: @service.freebusy.query,
					   body: JSON.dump({timeMin: timeBegin,
			 timeMax: timeEnd,
			 timeZone: zone,
			 items: ENV['NSCS_Calendar_ID']})
		)
		events = JSON.parse(response.body)
		#TODO iterate over events.
	end

	#TODO parse the time
	#Warning: This assumes that all events will happen in College Station.
	def insert_event(event)
		zone = Timezone.get('America/Chicago').now_zone

		
		response = @client.execute(api_method: @service.events.insert,
		parameters: {'calendarId' => ENV['NSCS_Calendar_ID'], body: JSON.dump({
		summary: event[:title],
	  	location: event[:location],
	  	description:  event[:description],
	  	start: {
		date_time: event[:start_date],
	    	time_zone: zone,
	  	},
	  	end: {
		date_time: event[:end_date],
	    	time_zone: zone,
	  	},
	  	recurrence: [
	    	#'RRULE:FREQ=DAILY;COUNT=1'
	  	],
	  	attendees: [
	   	# {email: 'lpage@example.com'},
	   	# {email: 'sbrin@example.com'},
	  	],
	  	reminders: {
	    	use_default: true,
	    	overrides: [
	    #  	{method' => 'email', 'minutes: 24 * 60},
	    #  	{method' => 'popup', 'minutes: 10},
	    	]
	  	}
		})})

	
	puts "It got created?"
	
	end

	def save_event

		if @even.nil?
			puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!NIIIIIIIIIIIIIIIIIIIL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		end

	end
end

