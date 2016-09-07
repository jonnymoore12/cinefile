class CinefilesController < ApplicationController

  def index
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @user.cinefiles.create
    redirect_to "/users/#{@user.id}"
  end

end
