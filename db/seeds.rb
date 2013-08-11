#user = User.new(firstname: "brandon", lastname: "bailey", email: "bbailey@bbailey.com", password: "1234", password_confirmation: "1234")
#user.save

#post = Post.new(title: "new post", body: "Boy this is wack")
#dates = []
#15.times {dates.push(rand(-35..0).days.ago.strf("%m-%d-%Y"))}

#b = User.create(
#              username: Faker::Internet.user_name,
#             email: Faker::Internet.email
#        )

require 'open-uri'
require 'nokogiri'
require 'pry'


hostname = 'http://www.wicker-park-bars.com/'
@doc = Nokogiri::HTML(open(hostname))


@doc.css('div#right ul').each do |bar_link|
  args = {}
  bar = Nokogiri::HTML(open(hostname + bar_link.css('a')[0]['href']))
  
  args[:name] = bar.css('div#content > div#left > div >h2').text
  args[:description] = bar.css('div#content > div#left > div > p')[0].text
  address = bar.css('div#content > div#left > div > p')[1].text
  args[:address] = address.gsub(/\n+[\t]*/, '').gsub(/' '/, '').split(',')

  puts Bar.create(args) 
end
