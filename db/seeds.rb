# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

User.find_each do |user|
  if user.facebook_access_token
    url = "https://graph.facebook.com/me/home?access_token=#{user.facebook_access_token}&limit=200"
    response = open(url).read
    posts = JSON.parse(response)["data"]
    posts.each do |post|
      user.posts.create :created_time => post["created_time"], 
                        :facebook_id => post["id"], 
                        :from_id => post["from"]["id"], 
                        :from_name => post["from"]["name"], 
                        :link => post["link"], 
                        :message => post["message"],
                        :type => post["type"], 
                        :likes_hash => post["likes"], 
                        :comments_hash => post["comments"]
    end
  end
end