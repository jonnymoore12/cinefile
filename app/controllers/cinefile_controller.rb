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
    @cinemas = Cinema.all
    @screenings = Screening.all
    @films = Film.all
    @user = current_user
    @cinefile = @user.cinefile
    @list_films = @cinefile.list_films.all
    @list_count = @list_films.count
    @films_with_upcoming_screenings = []
    @other_films_in_cinefile = []
    @list_films.each do |list_film|
      @films.each do |film|
        if film.id == list_film.film_id
          if film.upcoming_screening?
            @films_with_upcoming_screenings << film
          else
            @other_films_in_cinefile << film
          end
        end
      end
    end
    @film = Film.new
    if params[:film].nil?
      @searched_film = nil
    else
      @searched_film = params[:film]
    end
  end
end
