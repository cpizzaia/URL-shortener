# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'codyandpat@appacademy.io')
User.create(email: 'fakeemail@gmail.com')
User.create(email: 'Bob@nowhere.gov')

ShortenedUrl.create_for_user_and_long_url!(User.find(1), 'https://github.com/appacademy/sql-curriculum/blob/master/projects/w3d3-url-shortener.md')
ShortenedUrl.create_for_user_and_long_url!(User.find(1), 'http://www.google.com')
ShortenedUrl.create_for_user_and_long_url!(User.find(2), 'http://www.toolazytotypethisurl.com/')

Visit.record_visit!(User.find(1),ShortenedUrl.find(2))
Visit.record_visit!(User.find(3),ShortenedUrl.find(1))
Visit.record_visit!(User.find(3),ShortenedUrl.find(2))
Visit.record_visit!(User.find(3),ShortenedUrl.find(3))
