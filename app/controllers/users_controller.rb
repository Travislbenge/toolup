class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_session_path
    else
      render :new
    end
  end

  def destroy
    @tool = User.find(params[:id])
    @user.destroy
    redirect_to destroy_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :user_address)
  end
end
