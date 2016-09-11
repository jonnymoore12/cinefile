class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end
  #
  def create
    @film = Film.create(film_params)
    redirect_to '/films'
  end

  def destroy
    @film = Film.find(params[:id])
    @film.delete
    redirect_to films_path
  end

private

  def film_params
    params.require(:film).permit(:title, :tmdb_id)
    # Obviously this needs fixing!
    # params_to_split = params[:film_record]
    # params[:film_record] = params[:film_record].split(",")
    # Need code to define this (see total params hash below!)
  end
end

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"OCpf2bcXha65yNZIpNPU1iqBgb5W+QZdwunSuJoz3ZlXZv3LtkcSDQZQBYTP9OsRucmrgUJePYMsqH0JIhKdHw==", "film_record"=>"Batman: The Killing Joke,2016,382322", "commit"=>"Create Film"}
