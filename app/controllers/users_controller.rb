class UsersController < ApplicationController
  def login
	  @user = User.all
  end
  def logout
	  @user = User.find(session[:user_id])
	  session[:user_id] = nil
	  redirect_to "/publications/index"
  end
def check
	@current_user = User.where(params_user).first
	if @current_user
		session[:user_id]= @current_user.id
		redirect_to "/publications/index"
	else
		session[:user_id]= nil
		redirect_to "/users/login"
	end
end
  def create
	  @user = User.new params_user
	  @user.save
  end
  def new
	  @user = User.new
  end


  private

  def params_user

	  params.require(:user).permit(:name, :password)
  end
end
