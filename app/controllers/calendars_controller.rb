class CalendarsController < ApplicationController
	attr_accessor :calendar
	helper_method :get_events
	before_action :logged_in_user?
	
	#DRY method of calling current_user.
	#If nill redirect to login and instantiate calendar.
	def current_user
		super
		@calendar = Calendar.new(@current_user)
		#Evaluate before leaving so expects the same as current_user parent!
		@current_user
	end

	
	def list_events
			puts "<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>"
			@events = @calendar.list_events
	#		@events["items"].each do |event|
	#			@calendar.event
			puts @events			
	#		end
	end

	def insert_event
		#TODO checkout if instances vars between methods cause errs.
		#TODO decide wether they want to choose to send notification or not.
		#TODO Recurrense events?
		@new_event = Event.new
			#params.require(:new_event)
			puts 'Wtf'
			puts params

#		
#new_event.title = params[:new_event][:title]
#		new_event.description = params[:new_event][:description]
#		new_event.start_date = params[:new_event][:start_date]
#		mew_event.end_date = params[:new_event][:end_date] 
			
	end

	def show_event
		@event = params[:event]
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


