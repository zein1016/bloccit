require 'rails_helper'

describe User do 

  include TestFactories 
  describe "#favorited(post)" do 

    before do 
      topic = Topic.create
      @post = associated_post
      @post_2 = Post.new
      @user = authenticated_user
     
    end

    it "returns `nil` if the user has not favortied the post" do 
      expect(@user.favorites.first).to eq(nil)
    end
    it "returns the appropriate favorite if it exists" do
      favorite = Favorite.new(post: @post, user: @user)
      @user.favorites.where(post: @post.id)
    end
    it "returns `nil` if the user has favorited another post" do
      favorite = Favorite.new(post: @post_2, user: @user)
      expect(@user.favorites.where(post: @post.id).first).to eq(nil)
    end
  end
end