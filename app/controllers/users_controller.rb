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
    @films_in_cinefile = []
    @films_with_screenings = []
    @cinemas_with_screenings = []
    @list_films.each do |list_film|
      @films.each do |film|
        if film.id == list_film.film_id
          @films_in_cinefile << film
        end
    end
    @films_in_cinefile.each do |film|
      if film.upcoming_screening? == true
        @films_with_screenings << film
      end
    end
  end
  console
  end
end
# @cinemas.each do |cinema|
#   if cinema.screening_id == film.screening.id
#     @cinemas_with_screenings << cinema
#   end
