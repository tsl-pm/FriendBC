require 'open-uri'

class AuthController < ApplicationController
  def facebook
    if code = params[:code]
      facebook_app_id = '132081450279923'
      facebook_app_secret = 'a0ed5f078dd9ab4306bf081bdf335d7c'
      url = "https://graph.facebook.com/oauth/access_token?client_id=#{facebook_app_id}&redirect_uri=http://localhost:3000/auth/facebook&client_secret=#{facebook_app_secret}&code=#{code}"
      
      response = open(url).read
      access_token = response.split('&').first.split('=').last
            
      @current_user.facebook_access_token = access_token
      
      @current_user.facebook_id = JSON.parse(open("https://graph.facebook.com/me?access_token=#{access_token}").read)["id"]
            
      @current_user.save
      
      redirect_to root_url, :notice => 'Facebook authorization successful.'
    else
      redirect_to root_url, :notice => 'Facebook authorization unsuccessful. Please try again.'
    end
  end
end