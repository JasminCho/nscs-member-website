
class CalendarsController < ApplicationController
	attr_accessor :calendar
	helper_method :get_events
	before_action :logged_in_user?
	
	#DRY method of calling current_user.
	#If nill redirect to login and instantiate calendar.
	def current_user
		super
		@calendar = Calendar.new(@current_user)
		@calendar.save!
		puts @calendar
		#Evaluate before leaving so expects the same as current_user parent!
		@current_user
	end
	
	def list_events
	
			@events = @calendar.list_events

	end

	def insert_event
	
	#TODO checkout if instances vars between methods cause errs.
	#TODO decide wether they want to choose to send notification or not.
	#TODO Recurrense events?
		
		redirect_to new_event and return
	end

	def show_event
		@event = params[:event]
	end


	def new_event
	end

	def delete_event
	end

	def edit_event
	end

	def create

		params.require(:new_event).require(:title,:start_date,:end_date,:location,:description,)	
		params.require[:new_event].permit(:recurrance,:reminder)
		@calendar.insert_event(params)
	end

	

end


