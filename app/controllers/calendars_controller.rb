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


	def list_events
			puts "<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>"
			@events = @calendar.list_events
			puts @events			
	end

	def insert_event
		#TODO checkout if instances vars between methods cause errs.
		@new_event
			params.require(:event)
			params.require[:event].reqire(:title,:start_date,:end_date)	
	end

	def show_event
		@event = params[:event]
	end

	def delete_event
	end

	def edit_event
	end

end


