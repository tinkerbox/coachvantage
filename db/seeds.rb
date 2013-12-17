# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
%w[admin clarity aha team].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => "Admin", :email => "admin@coachvantage.com", :password => "changeme", :password_confirmation => "changeme"
puts 'user: ' << user.name
user.add_role :admin
user2 = User.find_or_create_by_email :name => 'ClarityUser', :email => 'clarity@coachvantage.com', :password => 'changeme', :password_confirmation => 'changeme'
user2.add_role :clarity
user3 = User.find_or_create_by_email :name => 'AhaUser', :email => 'aha@coachvantage.com', :password => 'changeme', :password_confirmation => 'changeme'
user3.add_role :aha
user4 = User.find_or_create_by_email :name => 'TeamUser', :email => 'team@coachvantage.com', :password => 'changeme', :password_confirmation => 'changeme'
user4.add_role :team
puts "users: #{user2.name}, #{user3.name}, #{user4.name}"