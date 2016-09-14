class UsersController < ApplicationController

  def create
    @user = current_user
    @user.cinefiles.create
    redirect_to "/"
  end

  def index
    @cinemas = Cinema.all
    @screenings = Screening.all
    @user = current_user
    @films = Film.all
    @cinefile = @user.cinefile
    @list_films = @cinefile.list_films.all
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
  end
end
