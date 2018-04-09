class Event < ApplicationRecord
	belongs_to :Calendar
	

	#TODO some parsing for the event.
	#TODO event may be a hash.
	def new(event)
		self.title=event.title
		self.description=event.description
		self.start_date=event.start_date
		self.end_date=event.end_date
		self.event_id=event.event_id
		self.location=event.location
		self.creator_email = event.creator_email
		self.created_at = event.created_at
	end	
end
