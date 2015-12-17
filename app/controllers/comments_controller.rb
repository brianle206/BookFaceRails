class CommentsController < ApplicationController
  def index
  end

  def create
  	user = User.find(params[:id])
  	message = Message.find(params[:mid])
  	Comment.create(comment: params[:comment], user: user, message: message)
  	redirect_to "/users/#{user.id}"
  end

  def destroy
  end
end
