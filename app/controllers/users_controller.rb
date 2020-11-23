class UsersController < ApplicationController
 before_action :user_find, only: [:show, :edit, :update] 

  def show
  end

  def edit
  end

  def update
    if @user.update(users_params)
      redirect_to user_path(@user)
    else
      render :edit
    end    
  end

  private

  def user_find
    @user = User.find(params[:id])
  end
  
  def users_params
    params.require(:user).permit(:first_name, :last_name, :username, :phone_number)
  end
  
end
