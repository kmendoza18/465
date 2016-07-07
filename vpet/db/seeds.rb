# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create (
[
 { email: 'admin@admin.com', name: "admin", password: "chicoadmin", password_confirmation: "chicoadmin"},
 { email: 'a@a.com', name: "Ashley", password: "123456", password_confirmation: "123456"},
 { email: 'b@b.com', name: "Bob", password: "123456", password_confirmation: "123456"},
 { email: 't@t.com', name: "Tyson", password: "123456", password_confirmation: "123456"},
]
)

pets = Pet.create (
[
    { name: "Amy", sex: "false", user_id: 2, health: 100, clean: 100, mood: 100, status: "false", age: Time.now, money: 50, cost: 0, newtime: Time.now },
    { name: "Scout", sex: "true", user_id: 3, health: 75, clean: 75, mood: 75, status: "false", age: Time.now, money: 50, cost: 0, newtime: Time.now },
    { name: "Henry", sex: "true", user_id: 4, health: 50, clean: 50, mood: 50, status: "true", age: Time.now, money: 50, cost: 0, newtime: Time.now },
]
)
