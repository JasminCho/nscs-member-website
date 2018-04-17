class Event < ApplicationRecord
	belongs_to :calendar, foreign_key: 'calendar_id'
end
