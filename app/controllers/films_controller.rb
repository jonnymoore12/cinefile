class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.create(film_params)
    if @film.save
      redirect_to '/films'
    else
      if @film.errors[:tmdb_id]
        flash[:notice] = 'Film already in db'
        redirect_to '/'
      else
        redirect_to '/films/new', alert: 'Some other problem'
      end
    end
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
