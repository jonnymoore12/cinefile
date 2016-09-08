class FilmListController < ApplicationController

  def edit
    @user = current_user
    @cinefile = @user.cinefile
    @film_list = @cinefile.film_list
  end

end
