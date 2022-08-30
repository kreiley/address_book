class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.is_password?(user_params[:password])
      session[:user_id] = @user.id
      redirect_to people_path
    else
      flash.now[:notice] = 'Invalid Email or Password'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
