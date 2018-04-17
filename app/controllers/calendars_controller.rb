
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

			@events = synchronize

	end

	def synchronize
		@events = @calendar.list_events
		@events["items"].each do |event|
			if(Event.find_by_event_id(event["id"]).nil?)
				add_event = @calendar.events.new
				@calendar.from_calendar(add_event,event)
				add_event.save!
			end
		end
		return @events
	end

	def show_event
		@event = params[:event]
	end


	def new_event
		@event = Event.new
	end

	def create_event

		@event = @calendar.events.new(new_event_params)
		if @event.save!
			@calendar.insert_event(@event)
			@calendar.save!


			flash[:notice]="Your event, " + @event[:title] + ", got saved!"
			redirect_to new_events_path
		else
			@event.destroy!
			render :new_event
		end
	end

	def new_event_params
		params.require(:event).merge(:calendar_id => ENV['NSCS_Calendar_ID']).permit(:title, :description, :start_date, :end_date, :location, :calendar_id, :start_time, :end_time)
	end

	def update_event_params
		params.require(:event).merge(:calendar_id => ENV['NSCS_Calendar_ID']).permit(:title, :description, :start_date, :end_date, :location, :calendar_id, :start_time, :end_time, :id, :event_id)
	end

	def delete_event
		@calendar.delete_event(params.permit(:event_id))
		Event.find_by_event_id(params.permit(:event_id)[:event_id]).destroy!
		flash[:notice]="Event got deleted succesfully."
		redirect_to list_events_path
	end

	def update_event
		@to_update = Event.find_by_event_id(params[:event][:event_id])

		if @to_update.update!(update_event_params)
			@calendar.update_event(@to_update)
			@calendar.save!
			flash[:notice]="Your event, " + @to_update[:title] + ", got saved!"
			redirect_to list_events_path
		else
			flash[:notice]="Your event, " + @to_update[:title] + ", could not be updated"
		end
	end

	def edit_event
		#Remember that this :id is an events id, not the database id.
		@event = Event.find_by_event_id(params[:event_id])
	end

end


