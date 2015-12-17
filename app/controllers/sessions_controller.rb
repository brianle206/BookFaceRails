class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:Email])
  	if user && user.authenticate(params[:Password])
  		session[:user_id] = user.id 
  		redirect_to "/users/#{user.id}"
  	else
  		flash[:error] = "Invalid Combination"
  		redirect_to '/'
  	end	
  end

  def logout
  	session[:user_id] = nil
  	redirect_to '/sessions/new'
  end
end
