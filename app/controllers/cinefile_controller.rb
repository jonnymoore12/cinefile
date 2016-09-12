class CinefileController < ApplicationController

  def index

  end

  def create
    @user = current_user
      if @user.cinefile.nil?
       @cinefile = Cinefile.create
       @user.cinefile = @cinefile
      end
    redirect_to user_cinefile_path(@user.id, @user.cinefile.id)
  end

  def show
    @films = Film.all
    @user = current_user
    @cinefile = @user.cinefile
    @list_films = @cinefile.list_films.all
    @info = []
    @list_films.each do |list_film|
      @films.each do |film|
        if film.id == list_film.film_id
          @info << film.title
          @info << film.release_year
        end
      end
    end
    @list_film = ListFilm.new
  end
end
