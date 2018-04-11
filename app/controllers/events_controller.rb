class EventsController < ApplicationController

#	before_action :logged_in_user?

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save!
			puts "The event was saved brotha"
			redirect_to @event
			
		else
			puts "Nah my son"
			render :new
		end
	end
	def event_params
		params.require(:event).merge(:calendar_id => ENV['NSCS_Calendar_ID']).permit(:title, :description, :start_date, :end_date, :location, :calendar_id)
	end
end 
