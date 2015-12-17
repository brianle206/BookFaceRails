class MessagesController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@message = Message.all
  end

  def create
  	user = User.find(params[:id])
  	message = Message.create(message: params[:content], user: user)
	redirect_to "/users/#{user.id}"
  end

  def destroy
  end
end
