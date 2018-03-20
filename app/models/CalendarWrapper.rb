class CalendarWrapper
        attr_accessor :client
	def initialize(current_user)
		configure_client(current_user)
	end

	def configure_client(current_user)
		@client = Google::APIClient.new
		@client.authorization.access_token = current_user.token
		@client.authorization.refresh_token = current_user.refresh_token
		@client.authorization.client_id =  ENV['google_client_id']
		@client.authorization.client_secret= ENV['google_client_secret']
		@client.authorization.refresh!
		@service = @client.discovered_api('calendar', 'v3')
	end
	
	def get_calendar_list()
		if(!@client.nil?)
			response = @client.execute(api_method: @service.calendar_list.list)
			calendars = JSON.parse(response.body)
		else
			nil
		end
	end

	def calendar_id(schedule)
		response = @client.execute(api_method: @service.calendar_list.list)
		calendars = JSON.parse(response.body)
		calendar = calendars["items"].select {|cal|
			cal["id"].downcase == schedule.calendar_id}
		calendar["id"]
	end

end

