module TestFactories 
    def associated_post(options = {})
   post_options = {
     title: 'Post title',
     body: 'Post bodies must be pretty long.',
     topic: Topic.create(name: 'Topic name',description: 'the description of a topic must be long'),
     user: authenticated_user
   }.merge(options)

   Post.create(post_options)
 end
 
 def authenticated_user(options = {})
  user_options = { email: "email#{rand}@fake.com", password: 'password'}.merge(options)
  user = User.new( user_options)
  user.skip_confirmation!
  user.save
  user 
 end


 def comment_without_email
  @user.update_attribute(:email_favorites, false)
  @comment = Comment.new(user: @user, post: @post, body:"A comment")
  @comment.save
 end
  
end 