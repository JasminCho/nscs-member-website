# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fake_members = [
  { email: 'gregorio_garza@email.tamu.edu', name: 'Greg', admin: true, pace: true },
  { email: 'yang.421@tamu.edu', name: 'Sen', admin: true, pace: true },
  { email: 'phamminhtris@tamu.edu', name: 'Tri Pham', admin: true, pace: true },
  { email: 'jasmincho@tamu.edu', name: 'Jasmin', admin: true, pace: true },
  { email: 'jtiu.edu@tamu.edu', name: 'Julian', admin: true, pace: true },
  { email: 'axk141430@tamu.edu', name: 'Akash', admin: true, pace: true },
  { email: 'jtiu.edu@gmail.com', name: 'Julian', admin: false, pace: true  },
  { email: 'fredericcollinsss@gmail.com', name: 'Tri Pham', admin: true, pace: true }
]

fake_members.each do |member|
  Member.create!(member)
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

Newsfeed.destroy_all

# fake_newsfeed = [
#   {event: 'NSCS official website is now deployed in Heroku'},
#   {event: 'NSCS developers say that website is well on its way'},
#   {event: 'Sen elected as NSCS\'s new president'}
# ]
#
#
# fake_newsfeed.each do |event|
#   Newsfeed.create(event)
# end
