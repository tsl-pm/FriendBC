require 'open-uri'

class PagesController < ApplicationController
  def home
    if @current_user
      url = "https://graph.facebook.com/me/home?access_token=#{@current_user.facebook_access_token}&limit=200"
      response = open(url).read
      @posts = JSON.parse(response)["data"]
    else
      redirect_to new_session_url, 'Please sign in.'
    end
  end
end