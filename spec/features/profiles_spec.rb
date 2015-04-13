require 'rails_helper'

describe "Visiting profiles" do 
  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!
  before do 
    @user = authenticated_user
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, post: @post, body:"A comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save
    
    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    user.save 
    login_as(user, :scope => :user)
    
  end

  describe "not signed in" do

    it "shows profile" do 
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end

  end

  describe "user visting own profile" do 

  it "shows profile" do 
    visit user_path(current_user)

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(user.name)
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@comment.body)
    end
  end
end