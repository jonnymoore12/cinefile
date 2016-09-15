class SearchController < ApplicationController
  require "pry"

  def new_search
    @user = current_user
    @cinefile = @user.cinefile
    if params[:search] == ""
      flash[:alert] = "Please enter a film in the search box"
      redirect_to user_cinefile_path(@user, @cinefile)
    else
      @searched_film = params[:search]
      redirect_to user_cinefile_path(@user, @cinefile, :film => @searched_film)
    end
  end

end
