class Event < ApplicationRecord
	belongs_to: Calendar
	

	#TODO some parsing for the event.
	#TODO event may be a hash.
	def new(event)
		self.title=event.title
		self.description=event.description
		self.start_date=event.start_date
		self.end_date=event.end_date
		self.event_id=event.event_id
	end	
end
