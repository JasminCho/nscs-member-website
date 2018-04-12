class Event < ApplicationRecord
	belongs_to :Calendar
	def change
		add_foreign_key :calendar_id
	end
end
