require 'rspec'
require 'date'
require_relative 'event'


describe Event do 
	describe '#check_event_created' do
		it 'returns if created' do
			expect(Event.new(date.month, date.day, date.year, "Some Event")).to eql(true)
		end
	end


	describre '#check_event_date_future' do
		it 'Checks if valid date' do
			date = Time.now
			expect(Event.new(date.month, date.day+1, date.year+30, "Some Event")).to eq(false)
		end
	end


	describe '#check_event_date_past' do
		it 'Checks if valid past date' do
			date = Time.now
			expect(Event.new(date.month, date.day-1, date.year-1, "Some Event")).to eq(false)
			expect(Event.new(date.month, date.day, date.year-1, "Some  Event")).to eq(false)
			expect(Event.new(date.month-1, date.day, date.year, "Some Event")).to eq(false)
		end
	end

	
	describe '#check_event_return' do


end
