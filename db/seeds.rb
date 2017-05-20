# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


r1 = Role.create(:name => 'user')
r2 = Role.create(:name => 'admin')
r3 = Role.create(:name => 'customer')
user1 = User.create(:email => 'user@gmail.com' , :password => 'user123', :role_id => r1.id)
user2 = User.create(:email => 'admin@gmail.com' , :password => 'admin123', :role_id => r2.id)
user3 = User.create(:email => 'customer@gmail.com', :password => 'customer123', :role_id => r3.id)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')