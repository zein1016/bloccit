require 'faker'

# Create Posts
50.times do 
  Post.create!(
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
if !Post.find_by(title: "New Post")
Post.create!(
  title: "New Post",
  body: "This is a new post"
  )
end
unless Comment.find_by(body: "New Comment")
  Comment.create!(
    body: "New Comment")
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"