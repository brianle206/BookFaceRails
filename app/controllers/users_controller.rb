class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @message = User.find(params[:id]).messages
    # @comment = User.find(params[:id]).messages.find(params[:id]).comments
  end

  def create
    if params[:Password] == params[:Password_Confirmation]
      user = User.create(first_name: params[:First_name],last_name: params[:Last_name], email: params[:Email], password: params[:Password])
      puts user
      if user.save == true
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
      else
        flash[:error] = user.errors.full_messages
        redirect_to '/signup'
     end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
