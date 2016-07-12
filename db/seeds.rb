# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.production?
  user = User.create!({name: 'Main', email: 'master@stronghold.com', password: 'AdMiNP4sS' })
  user.add_role :manager
else

  user = User.create!({name: 'Adminstration', email: 'admin@stronghold.com', password: '123456' })
  user.add_role :manager

  johnny = User.create!({name: 'Johnny', email: 'johnny@stronghold.com', password: '123456' })
  johnny.add_role :resident


end
