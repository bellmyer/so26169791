class User < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :followed_locations
  has_many :followed_users
  
  def followed_items
    followed_locations.map(&:location).flatten + followed_users.map(&:followed).flatten
  end
  
  def followed_comments
    followed_items.map(&:comments).flatten
  end
end
