class ListFilmsController < ApplicationController

  def new
    @user = current_user
    @cinefile = @user.cinefile
    @list_film = ListFilm.new
    @film = Film.new
  end

  def create
    @user = current_user
    @cinefile = @user.cinefile

    @cinefile.list_films.create(list_film_params)
    redirect_to user_cinefile_path(@user.id, @cinefile.id)
  end

  def list_film_params

    params.require(:list_film).permit(:film_id)

  end

end
