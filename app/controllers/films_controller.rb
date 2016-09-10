class FilmsController < ApplicationController
  #
  # def new
  #   @user = current_user
  #   @cinefile = Cinefile.find(params[:cinefile_id])
  #   @film = Film.new
  # end
  #
 def create
   @film = Film.create(film_params)
redirect_to '/'
  #   @user = current_user
  #   @cinefile = Cinefile.find(params[:cinefile_id])
  #   @user.cinefile.films.create(film_params)
  #   redirect_to user_cinefile_path(@user.id, @cinefile.id)
 end
  #
  # def destroy
  #   @user = current_user
  #   @cinefile = Cinefile.find(params[:cinefile_id])
  #   @film = Film.find(params[:id])
  #   @film.destroy
  #   flash[:notice] = 'Film deleted successfully'
  #   redirect_to user_cinefile_path(@user.id, @cinefile.id)
  # end
  #
  # private
  #
  def film_params
    # Obviously this needs fixing!
    params_to_split = params[:film_record]
    params[:film_record] = params[:film_record].split(",")
    # Need code to define this (see total params hash below!)
  end

end

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"OCpf2bcXha65yNZIpNPU1iqBgb5W+QZdwunSuJoz3ZlXZv3LtkcSDQZQBYTP9OsRucmrgUJePYMsqH0JIhKdHw==", "film_record"=>"Batman: The Killing Joke,2016,382322", "commit"=>"Create Film"}
