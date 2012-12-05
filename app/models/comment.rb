class Comment < ActiveRecord::Base
  attr_accessible :created_time, :facebook_id, :from_id, :from_name, :message, :post_id
  
  belongs_to :post
end
