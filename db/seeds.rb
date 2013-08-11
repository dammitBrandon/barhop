#user = User.new(firstname: "brandon", lastname: "bailey", email: "bbailey@bbailey.com", password: "1234", password_confirmation: "1234")
#user.save

#post = Post.new(title: "new post", body: "Boy this is wack")
#dates = []
#15.times {dates.push(rand(-35..0).days.ago.strf("%m-%d-%Y"))}

#b = User.create(
#              username: Faker::Internet.user_name,
#             email: Faker::Internet.email
#        )

require 'faker'

User.delete_all
Event.delete_all

#Create 5,000 users
users = 10.times.map do
  User.create :first_name => Faker::Name.first_name,
    :last_name  => Faker::Name.last_name,
    :username   => Faker::Internet.user_name,
    :email      => Faker::Internet.email,
    :birthdate  => Date.today - 15.years - rand(20000).days
end

events = 10.times.map do
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create :creator_id    => users[rand(users.length)].id,
    :name       => Faker::Company.name,
    :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :starts_at => start_time,
    :ends_at   => end_time
end

10.times do
  users.each do |u|
    u.attended_events.build(event_id: events[rand(10)].id)
    u.save
  end
end
