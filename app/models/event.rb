class Event < ApplicationRecord
	belongs_to :calendar, foreign_key: 'calendar_id'
	validates :end_date, presence: true, date: {after_or_equal_to: :start_date}
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
