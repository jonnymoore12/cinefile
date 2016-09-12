class FilmsController < ApplicationController

  def new
    @film = Film.new
  end

  def create
    @user = current_user
    @cinefile = @user.cinefile
    cinefile_id = @cinefile.id
    @film_info = params["film_record"].split(",")
    @film_release_year = @film_info[1]
    @tmdb_id = @film_info[2]
    @title = @film_info[0]
    film_not_in_database = Film.find_by(tmdb_id: @tmdb_id).nil?
    if film_not_in_database
      Film.create(title: @title, tmdb_id: @tmdb_id, release_year: @film_release_year)
    end
    film_id = Film.find_by(tmdb_id: @tmdb_id).id
    list_film_not_in_cinefile = ListFilm.find_by(film_id: film_id, cinefile_id: cinefile_id).nil?
    if list_film_not_in_cinefile
      ListFilm.create(film_id: film_id, cinefile_id: cinefile_id)
    else
      flash[:alert] = "#{@title} had previously been Cinefiled"
    end
    redirect_to user_cinefile_path(@user.id, @cinefile.id)
  end

private

  def film_params
    params.require(:film).permit(:title)
  end

end

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"OCpf2bcXha65yNZIpNPU1iqBgb5W+QZdwunSuJoz3ZlXZv3LtkcSDQZQBYTP9OsRucmrgUJePYMsqH0JIhKdHw==", "film_record"=>"Batman: The Killing Joke,2016,382322", "commit"=>"Create Film"}
