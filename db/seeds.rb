require 'faker'


# Create Users
5.times do
  user = User.new(
    name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all 

 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

# Create Posts
50.times do 
  Post.create!(
      user:    users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
    )
end

posts = Post.all

#Create Comments 
100.times do 
    Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.paragraph
      )
end
#Create Advertisements
10.times do 
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Lorem.word
    )
end

admin = User.new
admin.skip_confirmation!
admin.update_attributes!(
  email: 'zein@insidejob.co',
  password: 'testingtesting'
  )
admin.update_attribute(:role, 'admin')
admin.save

moderator = User.new
moderator.skip_confirmation!
moderator.update_attributes!(
  email: 'zein.khalifeh@gmail.com',
  password: 'testingtesting'
  )
moderator.update_attribute(:role, 'moderator')
moderator.save

user = User.new
user.skip_confirmation!
user.update_attributes!(
  email: 'zein.khalifeh@hotmail.com',
  password: 'testingtesting'
  )
user.save



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
