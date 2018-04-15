class Event < ApplicationRecord
	belongs_to :Calendar, class_name: 'Calendar', foreign_key: 'calendar_id'
	def change
		add_foreign_key :calendar_id
	end
end
