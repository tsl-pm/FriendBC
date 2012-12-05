class Post < ActiveRecord::Base
  attr_accessible :created_time, :facebook_id, :from_id, :from_name, :likes, :link, :message, :user_id, :type, :likes_hash, :comments_hash
  attr_accessor :type, :comments_hash
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  validate :post_must_contain_video
  validates :facebook_id, :uniqueness => {:scope => :user_id}
   
  after_save :create_comments
  
  #TODO Add an update_comments method
  
  def post_must_contain_video
    if self.type != "video" || self.link.blank?
      self.errors.add(:link, 'must contain a video')
    end
  end
  
  def likes_hash=(likes_hash)
    self.likes = likes_hash["count"] if likes_hash.present?
  end
  
  def create_comments
    if self.comments_hash && self.comments_hash["data"]
      self.comments_hash["data"].each do |comment|
        self.comments.create :created_time => comment["created_time"], 
                             :facebook_id => comment["id"], 
                             :from_id => comment["from"]["id"], 
                             :from_name => comment["from"]["name"], 
                             :message => comment["message"]
      end
    end
  end
end
