class CalendarController < ActionController::Base
	helper_method  :get_calendars

	def get_calendars(current_user)
		if(!current_user.nil?)
			@calendar = CalendarWrapper.new(current_user)
			put @calendar.get_calendar_list()
		else
			nil
		end
	end
end


