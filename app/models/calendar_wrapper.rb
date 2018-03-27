class CalendarWrapper
        attr_accessor :client

	def initialize(current_user)
		configure_client(current_user)
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

	def is_valid_time(timeBegin, timeEnd)
		
	
		#freebusy method only responds to a couple of months (maybe <=3)
		response = @client.execute(api_method: @service.freebusy.query,
		   body: JSON.dump({timeMin: timeBegin,
		   timeMax: timeEnd,
		   timeZone: "GMT",
		   items: ENV['NSCS_Calendar_ID']}),
		headers: {'Content-Type' => 'application/json'})
		events = JSON.parse(response.body)
	end
		

end

