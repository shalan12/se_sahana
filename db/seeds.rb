# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'that-one-guy', password: 'meh', user_type: 'donor')
User.create(username: 'worker', password: 'mework', user_type: 'field-worker')
50.times { Fabricate(:user) }
50.times {Fabricate(:emergency)}
