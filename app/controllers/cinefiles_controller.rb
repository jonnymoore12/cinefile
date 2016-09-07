class CinefilesController < ApplicationController

  def index
  end

  def create
    @user = current_user
    @user.cinefiles.create if !@user.cinefiles.any?
    redirect_to "/users/#{@user.id}/cinefiles/#{@user.cinefiles.first.id}"
  end

  def show
    @user = current_user
  end

end
