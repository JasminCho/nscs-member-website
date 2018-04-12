# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fake_members = [
    { email: 'jasmincho97@gmail.com', name: 'Jasmin', pace: true },
    { email: 'jtiu.edu@gmail.com', name: 'Julian' , pace: true },
    { email: 'akashkundu92@gmail.com', name: 'Akash' , pace: true },
    { email: 'fatezero.sen@gmail.com', name: 'Sen' , pace: true },
    { email: 'fredericcollinsss@gmail.com', name: 'Tri' , pace: true },
    { email: 'ggregar@gmail.com', name: 'Greg' , pace: true }
]

fake_members.each do |member|
  Member.create!(member)
end

fake_officers = [
  { email: 'jtiu.edu@gmail.com', name: 'Julian', position: 'President', major: 'Junior', year: '2019'},
  { email: 'jasmincho97@gmail.com', name: 'Jasmin', position: 'Vice President', major: 'Junior', year: '2019'},
  { email: 'akashkundu92@gmail.com', name: 'Akash', position: 'Peasant', major: 'Junior', year: '2019'},
  { email: 'fatezero.sen@gmail.com', name: 'Sen', position: 'Zero Fate', major: 'Junior', year: '2019'},
  { email: 'fredericcollinsss@gmail.com', name: 'Tri', position: 'Tree', major: 'Junior', year: '2019'},
  { email: 'ggregar@gmail.com', name: 'Greg', position: 'Latin Lover', major: 'Junior', year: '2019'}
]

fake_officers.each do |officer|
  Officer.create(officer)
end

fake_points = [
  { email: 'gregorio_garza@email.tamu.edu', event_name: 'Event A', point: 100 },
  { email: 'yang.421@tamu.edu', event_name: 'Event B', point: 100 },
  { email: 'yang.421@tamu.edu', event_name: 'Event C', point: 100 },
  { email: 'phamminhtris@tamu.edu', event_name: 'Event A', point: 100 }
]

fake_points.each do |point|
  Point.create!(point)
end

=begin
fake_newsfeed = [
  {event: 'NSCS official website is now deployed in Heroku'},
  {event: 'NSCS developers say that website is well on its way'},
  {event: 'Sen elected as NSCS\'s new president'}
]


fake_newsfeed.each do |event|
  Newsfeed.create(event)
end
=end
