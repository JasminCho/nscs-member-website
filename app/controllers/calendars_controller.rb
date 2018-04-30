
class CalendarsController < ApplicationController
	attr_accessor :calendar
	helper_method :get_events
	before_action :logged_in_user?, :except => [:list_events, :show_event]
	before_action :logged_in_admin?, :only => [:new_event, :create_event, :delete_event, :update_event, :edit_event]
	#before_action :logged
	#Check if the before an action method, will not call logged in user on current_user,
	#However instead call just current_user.


	#DRY method of calling current_user.
	#If nill redirect to login and instantiate calendar.
	def current_user
		if(super.nil?) ;return nil ;end

		#Stupid way of doing it, but we need to call each time for a new APIClient object.
		#Since object cannot persist.

		@calendar = Calendar.new(@current_user)
		#No need but if need.
		#session[:calendar_id] = @calendar.calendar_id
		#Save once.

		if (Calendar.find_by(calendar_id: @calendar.calendar_id)).nil?
				@calendar.save!
		end
		

		#Evaluate before leaving so expects the same as current_user parent!
	
		@current_user
	end
	

	#Problem. Allow non members to view the calendar events, but at the same time allow the members to edit.
	#How was it before?
	def list_events

		if(current_user)
			@events = synchronize
			@events = Event.all
		else
			@events = Event.all
		end

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
		@event =Event.find_by_event_id(params["event_id"])
	end


	def new_event
		@event = Event.new
	end

	def create_event


		@event = @calendar.events.new(new_event_params)
		
		
		#Grab form paramaters to re render from @event.
		if((params[:event][:start_date].to_date > (DateTime.now.to_date + 5.year)) || 
			(params[:event][:start_date].to_date < (DateTime.now.to_date - 5.year)))
			flash[:notice]="Your event, cannot be more than five years in the future or past"
			#No save.
			render :new_event and return
		end

		#Save the form parameters.
		if @event.save
			#Receive the google extra id parameters.
			@calendar.insert_event(@event)
			#Save the google id params.	
			@event.save!
			@calendar.save!


			flash[:notice]="Your event, " + @event[:title] + ", got saved!"
			redirect_to new_events_path
		else
			invalid_message(@event, "saved")
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
	
		@calendar.delete_event(params.permit(:event_id)[:event_id])
		Event.find_by_event_id(params.permit(:event_id)[:event_id]).destroy!
		flash[:notice]="Event got deleted succesfully."
		redirect_to list_events_path
	end

	#You cannot update events that are 5 years older, or 5 years in the future.
	def update_event	
		@to_update = Event.find_by_event_id(params[:event][:event_id])
		# First update it in the database.
		if((params[:event][:start_date].to_date > (DateTime.now.to_date + 5.year)) || 
			(params[:event][:start_date].to_date < (DateTime.now.to_date - 5.year)))
			flash[:notice]="Your event, cannot be more than five years in the future or past"

			redirect_to edit_event_path( :event_id => @to_update[:event_id]) and return
			
		end

		if @to_update.update(update_event_params)
			#IF updated in database, updated in cloud.
			@calendar.update_event(@to_update)
			#Save changes for calendar event.
			@to_update.save!
			@calendar.save!

			flash[:notice]="Your event, " + @to_update[:title] + ", got saved!"
			redirect_to list_events_path
		else
			invalid_message(@to_update, "updated")
			#:event_id => Hash.new
			redirect_to edit_event_path( :event_id => @to_update[:event_id])
		end
	end

	def invalid_message(inv_event, str)
		if !inv_event.errors[:end_date].blank?
			flash[:notice]="Your event, " + inv_event[:title] + ", could not be "+ str + " " + inv_event.errors[:end_date].first
		elsif !inv_event.errors[:end_time].blank?
			flash[:notice]="Your event, " + inv_event[:title] + ", could not be "+ str + " " + inv_event.errors[:end_time].first
		end
	end

	def edit_event
		#Remember that this :id is an events id, not the database id.
		@event = Event.find_by_event_id(params[:event_id])
	end

end


