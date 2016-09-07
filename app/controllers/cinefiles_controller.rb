class CinefilesController < ApplicationController

  def index
  end

  def create
    @user = current_user
    @user.cinefiles.create if !@user.cinefiles.any?
    redirect_to user_cinefile_path(@user.id, @user.cinefiles.first.id)
  end

  def show
    @user = current_user
  end

end
