class CalendarsController < ActionController::Base
	helper_method  :get_calendars

	def get_calendars
		@calendar_user = User.find(session[:user_id]) if session[:user_id]
		if(!@calendar_user.nil?)
			@calendar = CalendarWrapper.new(@calendar_user)
			@calendar.calendar_id
		else
			nil
		end
	end
end


