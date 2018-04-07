# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fake_members = [
    { email: 'gregorio_garza@email.tamu.edu', name: 'Greg', admin: true },
    { email: 'yang.421@tamu.edu', name: 'Sen', admin: true },
    { email: 'phamminhtris@tamu.edu', name: 'Tri Pham', admin: true },
    { email: 'jasmincho@tamu.edu', name: 'Jasmin', admin: true },
    { email: 'jtiu.edu@tamu.edu', name: 'Julian' , admin: true },
    { email: 'axk141430@tamu.edu', name: 'Akash' , admin: true },
    { email: 'jtiu.edu@gmail.com', name: 'Julian' , admin: false }
]

fake_members.each do |member|
  Member.create!(member)
end

Newsfeed.destroy_all

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
