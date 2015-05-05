require 'rails_helper'

describe User do 

  describe "#favorited(post)" do 

   before do 
     @post = create(:post)
     @post_2 = create(:post)
     @user = create(:user_with_post_and_comment)
     end
    

     it "returns `nil` if the user has not favortied the post" do 
       expect(@user.favorites.first).to eq(nil)
     end
     it "returns the appropriate favorite if it exists" do
       favorite = Favorite.create!(post: @post, user: @user)
       expect(@user.favorited(@post)).to eq(favorite)
    end
     it "returns `nil` if the user has favorited another post" do
       favorite = Favorite.create!(post: @post_2, user: @user)
       expect(@user.favorited(@post)).to eq(nil)
     end
   end


  describe ".top_rated" do 
    before do 
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post)}
    end

    it "returns users ordered by comments + posts" do 
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "stores a `posts_count` on user" do 
      users = User.top_rated 
      expect( users.first.posts_count).to eq(1)
    end

    it "stores a `comments_count` on a user " do 
      users = User.top_rated
      expect( users.first.comments_count).to eq(2)
    end
  end
end