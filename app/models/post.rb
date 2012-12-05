class Post < ActiveRecord::Base
  attr_accessible :created_time, :facebook_id, :from_id, :from_name, :likes, :link, :message, :user_id
  
  belongs_to :user
  has_many :comments
end
