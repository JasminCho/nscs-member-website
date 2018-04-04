class CalendarsController < ApplicationController
	attr_accessor :calendar
	helper_method :get_events
	before_action :logged_in_user?
	
	#DRY method of calling current_user.
	#If nill redirect to login and instantiate calendar.
	def current_user
		super
		@calendar = CalendarWrapper.new(@current_user)

		#Evaluate before leaving so expects the same as current_user parent!
		@current_user
	end


	def get_events
			puts "<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>"
			@events = @calendar.list_events
			puts @events			
	end

	def insert_event
			params.require(:event)
			params.require[:event].reqire(:title,:start_date,:end_date)	
	end

	def get_event
	end	
end


