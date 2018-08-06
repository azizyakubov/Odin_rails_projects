class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # debugger   #Ctrl+D to release debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user #keeps the user logged in after signup
      flash[:success] = "Thanks for signing up! :) "
      redirect_to @user
    else
      render 'new'
    end
  end



  private
  # Strong parameters that only permit necessary info for the #create method
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
