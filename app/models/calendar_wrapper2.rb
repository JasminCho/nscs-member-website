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
                                                                 "client_secret" => ENV['google_client_secret']
                                                             }
                                                             })


    #	@client.key = ENV['GOOGLE_CALENDAR_API_KEY']
    #	@client.authorization = current_user.oauth.token
    #	@client.authentication.access_token = current_user.oauth_token
    #	@client.authentication.refresh_token = current_user.refresh_token
    #@client.authentication.client_id =  ENV['google_client_id']
    #@client.authentication.client_secret= ENV['google_client_secret']
    #	@client.authorization = authorization.to_authorization
    #@client.authentication.refresh!
    #@client.authorization.access_token = current_user.oauth_token
    if !authorization.nil?
      puts "authorization"
      puts authorization
      puts "to authorization"
      puts authorization.to_authorization
    end
    if authorization.nil?
      puts "The authorization failed"
    end

    @client.authorization = authorization.to_authorization
    #	@client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
    @calendar = ENV[NSCS_Calendar_ID]
  end

  def get_calendar_list()
    if (!@client.nil?)
      response = @client.execute(api_method: @service.calendar_list.list)
      calendars = JSON.parse(response.body)
    else
      puts "Client No Calendar boi"
    end
  end

  def calendar_id()
    calendar_id = "tamu.edu_lkjcimlfp2qgv12vqhhoqdnk28@group.calendar.google.com"
    #	response = @client.execute(api_method: @service.freebusy.query,
    #freebusy method only responds to a couple of months (maybe <=3)
    #	response = @client.execute(api_method: @service.
    #	body: JSON.dump({timeMin: "2018-01-20T11:04:00+0000",
    #	   timeMax: "2018-03-20T11:04:00+0000",
    #	   timeZone: "GMT",
    #	   items: ["tamu.edu_lkjcimlfp2qgv12vqhhoqdnk28@group.calendar.google.com"]}),
    #	headers: {'Content-Type' => 'application/json'})
    #	events = JSON.parse(response.body)
    puts "Here are the Methods"; puts @service.events.list
    response = @client.execute(api_method: @service.events.list,
                               parameters: {'calendarId' => calendar_id})
    # max_results: 10,
    # single_events: true,
    # order_by: 'startTime',
    # time_min: Time.now.iso8601))
    calendars = JSON.parse(response.body)
  end

  def check_event_time(time)
    calendar_id = "tam"
  end
end

