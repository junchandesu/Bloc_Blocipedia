require 'faker'

roles = ['premium', 'standard']

10.times do
	user = User.new(
		name: 	Faker::Name.name,
		email:  Faker::Internet.email,
		password: Faker::Lorem.characters(10),
		role: roles.sample
		)
	user.skip_confirmation!
	user.save!
end


user = User.new(
	name: 'junjun',
	email: 'aliciajace@gmail.com',
	password: 'helloworld',
	role: 'premium'
	)
	user.skip_confirmation!
	user.save!

admin = User.new(
     name:     'Admin User',
     email:    'admin@example.com',
     password: 'helloworld',
     role:     'admin'
   )
   admin.skip_confirmation!
   admin.save!

users = User.all

50.times do
  Wiki.create!(
  	user: users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph, 
    private: false
	)
end

30.times do
  Wiki.create!(
  	user: users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph, 
    private: true
	)
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"