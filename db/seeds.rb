# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Server.create(name: 'testbox', token: 'test123')
Server.create(name: 'rogbox1', token: '123-ac23a-331', ip:'127.0.0.1')
User.create(email: 'test@test.com', password: 'password1')
