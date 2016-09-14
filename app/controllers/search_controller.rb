class SearchController < ApplicationController
  require "pry"

  def new_search
    @searched_film = params[:search]
    @user = current_user
    @cinefile = @user.cinefile
    redirect_to user_cinefile_path(@user, @cinefile, :film => @searched_film)
  end

end
