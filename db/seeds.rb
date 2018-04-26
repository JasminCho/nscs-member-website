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
    { email: 'fredericcollinss@gmail.com', name: 'Tri' , pace: false },
    { email: 'fredericcollinsss@gmail.com', name: 'Tri2' , pace: true },
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

fake_faqs = [
  {question: 'When and where are the meetings?',
   answer: 'Every event is worth 3 points! For most of our events you will also be
          able to receive additional points by bringing a friend (1pt) and/or
          wearing your NSCS t-shirt (1pt). Occasionally there will be opportunities
          to receive even more points, but these opportunities are time sensitive.
          You will always hear of these opportunities at our monthly meetings and
          once again in my emails. An example of this would be the animal shelter
          donation we often host, where each item donated is worth one point.
          Ultimately your goal is to reach 150 points by graduation to receive
          your NSCS graduation cords. Ideally, we recommend every member shoot for
          at least 25 points per semester to reach this goal by the end of their
          senior year. We are not implying that you are required to meet this standard;
          it is simply a recommendation. That being said, you can receive these
          chords even if you do not reach 150 points by graduation, paying for
          them out of pocket through the official NSCS website. We understand
          that 150 points may sound like an excessive amount, but we do our best
          to provide our members with as many fun and easy opportunities to receive
          these points throughout the semester.'
  },
  { question: 'How does the point system work?',
    answer: 'Every event is worth 3 points! For most of our events you will also be
          able to receive additional points by bringing a friend (1pt) and/or
          wearing your NSCS t-shirt (1pt). Occasionally there will be opportunities
          to receive even more points, but these opportunities are time sensitive.
          You will always hear of these opportunities at our monthly meetings and
          once again in my emails. An example of this would be the animal shelter
          donation we often host, where each item donated is worth one point.
          Ultimately your goal is to reach 150 points by graduation to receive
          your NSCS graduation cords. Ideally, we recommend every member shoot for
          at least 25 points per semester to reach this goal by the end of their
          senior year. We are not implying that you are required to meet this standard;
          it is simply a recommendation. That being said, you can receive these
          chords even if you do not reach 150 points by graduation, paying for
          them out of pocket through the official NSCS website. We understand
          that 150 points may sound like an excessive amount, but we do our best
          to provide our members with as many fun and easy opportunities to receive
          these points throughout the semester.'
  },
  { question: 'How can I stay in touch with NSCS?',
    answer: 'You can always find out more information on our Facebook page. We do
          our best to keep everything updated and posted on our events page. We
          are also located on Maroonlink, but please note that the only events
          that will ever be posted on this webpage are general meetings! If you
          ever have any questions or concerns with the information posted on either
          of these websites, please do not hesitate to contact an officer. Or if you
          ever have any suggestions or ideas regrading NSCS, don\'t be shy, we would
          love to hear from you!'
  },
  {  question: 'NSCS is a large organization, so how will I get to know anyone?',
     answer: 'Our chapter of NSCS recently implemented small groups into our organization.
          We use these small groups to make lasting connections with other students!
          We have GroupMe\'s and use these to communicate with each other! If you
          are a current member, please send your phone number and name to
          tamunscsmedia@gmail.com and you will be added to a small group!
          This will be a great way to get involved and an easy way to contact an
          officer if you have any questions or concerns!'
  }
]

fake_faqs.each do |faqs|
  Faq.create(faqs)
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
