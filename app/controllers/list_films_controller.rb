class ListFilmsController < ApplicationController

  def new
    @user = current_user
    @cinefile = @user.cinefile
    @list_film = ListFilm.new
    @film = Film.new
  end

  def create
    #byebug
    @user = current_user
    @cinefile = @user.cinefile
    ref_id = params[:list_film]['film_id'].to_i
    
    if Film.exists?(ref_id)
      # Film.exists?(tmdb_id: ref_tmdb)
      @cinefile.list_films.create(film_id: ref_id)
    else
      @cinefile.list_films.create(list_film_params)
    end
    redirect_to user_cinefile_path(@user.id, @cinefile.id)
  end

  def list_film_params
    params.require(:list_film).permit(:film_id)
  end
end
