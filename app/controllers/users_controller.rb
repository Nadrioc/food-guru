class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :image, :email, :password)
  end
end
