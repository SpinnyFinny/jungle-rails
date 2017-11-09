class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #create user based on form
    #check if valid
    # if it works, redirect to root
    # if it fails, redirect to same page 
    # and tell user they suck at registration
    # like srsly, is this your first time on the internet?!?
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'User registered!'
    else
      redirect_to new_user_url, notice: 'You are wrong, and you should feel bad.'
    end
  end

  private 

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
