class ListFilmsController < ApplicationController

  def new
    @user = current_user
    @cinefile = @user.cinefile
    @list_film = ListFilm.new
    # This @filmtemp is not for final code - it's to help with the debugging of the params
    # returned by the select box as it was simpler to send it via the new film route
    @filmtemp = Film.new
  end

  def create
    @films = Film.all
    # Maybe add an if any...
    # This code should check if the tmdb_id in the params matches a film we already have
    # If it does, it uses the existing film_id in the creation of the list_film
    # No code yet for what happens if a new film is required
    @films.each do |film|
      if film.tmdb_id == list_film_params["tmdb_id"]
        @ref = film.id
      end
    end
    @user = current_user
    @cinefile = @user.cinefile
    @cinefile.list_films.create(film_id: @ref)
    redirect_to user_cinefile_path(@user.id, @cinefile.id)
  end

  def list_film_params
   # Need definition here! 
  end

end
