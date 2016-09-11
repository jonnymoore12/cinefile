class FilmsController < ApplicationController

  def new
    @film = Film.new
  end

  def create
    @films = Film.all
    @user = current_user
    @cinefile = @user.cinefile
    cinefile_id = @cinefile.id
    # Currently won't have any info like tmdb_id, etc.
    Film.create(title: params[:film][:title]) if Film.find_by(title: params[:film][:title]).nil?
    # Find a better way to pull our the id
    film_id = Film.last.id
    redirect_to user_cinefile_list_films_path(@user.id, @cinefile.id), method: :post
  end

private

  def film_params
    params.require(:film).permit(:title)
  end

end

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"OCpf2bcXha65yNZIpNPU1iqBgb5W+QZdwunSuJoz3ZlXZv3LtkcSDQZQBYTP9OsRucmrgUJePYMsqH0JIhKdHw==", "film_record"=>"Batman: The Killing Joke,2016,382322", "commit"=>"Create Film"}
