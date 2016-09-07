class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def create
    @user = current_user
    @user.cinefiles.create
    redirect_to "/"
  end

end
