class AuthController < ApplicationController
  def facebook
    if code = params[:code]
      redirect_to root_url, :notice => 'Facebook authorization successful.'
    else
      redirect_to root_url, :notice => 'Facebook authorization unsuccessful. Please try again.'
    end
  end
end