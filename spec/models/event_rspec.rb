require 'rails_helper'
require 'date'
require_relative 'event'


describe Event do 
	describe '#check_event_created' do
		it 'returns if created' do
			date = Time.now
			expect(Event.new(date.month, date.day, date.year, "Some Event")).to eql(true)
		end
	end


	describe '#check_event_date_future' do
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

	
	describe '#check_event_return_date' do
		it 'Checks formatted date' do
			date = Time.now
			event = Event.new(date.month, date.day, date.year, "Some Event")
			expect(event.return_date).to eql(date.month.to_s + "/" + date.day.to_s + "/" + date.year.to_s)
		end
	end

	describe '#check_event_title' do
		it 'Checks event title' do
			date = Time.now
			event = Event.new(date.month, date.day, date.year, "Some Event")
			expect(event.return_title).to eql("Some Event")
		end
	end

end
