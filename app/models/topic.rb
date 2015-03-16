class Topic < ActiveRecord::Base
  include ::Pagination

  has_many :posts

end
