class Post < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :topic
   
  default_scope { order('rank DESC')}
   scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true)}

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :user, presence: true
   validates :topic, presence: true
   
  

   def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count 
  end


  def points
    votes.sum(:value)
  end

  def update_rank 
    age_in_days = ( created_at - Time.new(1970,1,1)) / (60 * 60 * 24)
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end
  
  

  def create_vote
    user.votes.create(value: 1, post: self)
    # user.votes.create(value: 1, post: self)
    # self.user.votes.create(value: 1, post: self)
    # votes.create(value: 1, user: user)
    # self.votes.create(value: 1, user: user)

    # vote = Vote.create(value: 1, user: user, post: self)
    # self.votes << vote
    # save
  end

end
