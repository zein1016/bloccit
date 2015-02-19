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
#Create Advertisements
10.times do 
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Lorem.word
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
