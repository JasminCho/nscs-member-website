
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
		
	#	redirect_to new_event and return
	end

	def show_event
		@event = params[:event]
	end


	def new_event
		@event = Event.new
	end

	def create_event
		@event = @calendar.events.new(event_params)
		if @event.save!
			@calendar.insert_event(@event)
			@calendar.save!

			debugger
			#@event.update_attributes(@event)
			flash[:notice]="Your event, " + @event[:title] + ", got saved!"
			redirect_to new_events_path
		else
			@event.destroy!
			render :new_event
		end
	end

	def event_params
		params.require(:event).merge(:calendar_id => ENV['NSCS_Calendar_ID']).permit(:title, :description, :start_date, :end_date, :location, :calendar_id, :start_time, :end_time)
	end

	def delete_event
		@calendar.delete_event)(params.require(:event_id))
		flash[:notice]="Event got deleted succesfully."
		redirect_to list_events_path
	end

	def edit_event
		#@
	end

	def update_event
	end


	def create

		params.require(:new_event).require(:title,:start_date,:end_date,:location,:description,)	
		params.require[:new_event].permit(:recurrance,:reminder)
		@calendar.insert_event(params)
	end

	#TODO make the routes.
	#Finish the updating part.
	#Make the views for the updating form.
	

end


