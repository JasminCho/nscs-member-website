class CalendarsController < ActionController::Base
	helper_method  :get_calendars

	def get_calendar_events
		@calendar_user = User.find(session[:user_id]) if session[:user_id]
		if(!@calendar_user.nil?)
			@calendar = CalendarWrapper.new(@calendar_user)
			@calendar.list_events
		else
			nil
		end
	end

	def insert_event
		end
end


