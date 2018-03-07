

require 'rspec'
require 'date'
require_relative 'calendar'
require_relative 'event'


describe Calendar do
	describe '#new_event' do
		it 'returns the confirmation' do
			calendar = Calendar.new
			event = Event.new(12, 12, 2019, "Some Event")
			expect(calendar.event).to eql(true)
		end
	end
end

