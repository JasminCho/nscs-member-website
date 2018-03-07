

require 'rails_helper'
require 'date'
require_relative '../../app/models/event'
require_relative '../../app/models/calendar'



describe Calendar, type: :model do
	describe '#new_event' do
		it 'returns the confirmation' do
			calendar= Calendar.new
			event = Event.new(12, 12, 2019, "Some Event")
			expect(calendar.add_event(event)).to eql(true)
		end
	end
end

