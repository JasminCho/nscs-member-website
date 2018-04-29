class Event < ApplicationRecord
	belongs_to :calendar, foreign_key: 'calendar_id'

	#End date after start date.
	validates :end_date, presence: true, date: {after_or_equal_to: :start_date}

	#Limit the event to 2 days.
	#TODO.
	#validates :end_date, presence: true, date: {before: Proc.new {:start_date + 2.day}}

	#Cannot validate limit on year since there could be events that Google has previous to such.
	#validates :start_date, presence: true, date: {after_or_equal_to: Proc.new{Time.now - 5.year} ,
	# before: Proc.new{Time.now + 5.year}}
	
	#Check if time is after too.
	validate :valid_time

	private
	def valid_time
		if(end_date == start_date)
			if( end_time <= start_time)
				errors.add(:end_time, "as ending time must be later than starting time.")
			end
		end
	end

#	validates :end_time, prescence:true, date: {if }
end
