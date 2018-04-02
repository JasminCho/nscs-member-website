class CalendarsController < ApplicationController
	helper_method  :get_cals
	attr_accessor :calendar
	before_action :logged_in_user?, :calendar_in? unless :initialize


	def initialize
		@calendar = CalendarWrapper.new(current_user)
	end
	
	def calendar_in?
		unless !@calendar.nil?
			flash[:danger] = "Calendar not initialized, did you get here by accident?"
			redirect_to home
		end
	end


	def get_events
	
			@calendar = CalendarWrapper.new(current_user)
			@calendar.list_events
	end

	def insert_event
			
	end
end


