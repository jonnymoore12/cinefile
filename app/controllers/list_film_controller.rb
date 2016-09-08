class ListFilmController < ApplicationController

  def edit
    @user = current_user
    @cinefile = @user.cinefile
    @list_film = @cinefile.list_film
  end

end
