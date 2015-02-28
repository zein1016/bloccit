require 'faker'

# Create Topics 
15.times do
  Topic.create!(
    name:          Faker::Lorem.sentence,
    description:   Faker::Lorem.paragraph  
    )
end 
topics = Topic.all 


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
      topic:   topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
    )
end

posts = Post.all


# Create Summaries

50.times do 
  Summary.create!(
    post:  posts.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
     )
end

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

# Create an admin user
admin = User.new(
  name:        'Admin User',
  email:       'zein.khalifeh@hotmail.com',
  password:    'testingtesting',
  role:        'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
  name:        'Moderator User',
  email:       'zein.khalifeh@insidejob.co',
  password:    'testingtesting',
  role:        'moderator'
  )
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
  name:        'Member User',
  email:       'zein.khalifeh@gmail.com',
  password:    'testingtesting'
  )
member.skip_confirmation!
member.save!


puts "Seed finished"
puts "#{Summary.count} summaries created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
