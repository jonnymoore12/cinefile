class ListFilmsController < ApplicationController

  def new
    @user = current_user
    @cinefile = @user.cinefile
    @list_film = ListFilm.new
    @filmtemp = Film.new
  end

  def create
    @films = Film.all
    @films.each do |film|
      if film.title == list_film_params["title"]
        @ref = film.id
      end
    end
    @user = current_user
    @cinefile = @user.cinefile
    @cinefile.list_films.create(film_id: @ref)
    redirect_to user_cinefile_path(@user.id, @cinefile.id)
  end

  def list_film_params
    params.require(:list_film).permit(:title)
  end

end
