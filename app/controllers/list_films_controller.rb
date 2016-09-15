class ListFilmsController < ApplicationController

  def index
    @cinemas = Cinema.all
    @screenings = Screening.all
    @user = current_user
    @films = Film.all
    @cinefile = @user.cinefile
    if @cinefile
      @list_films = @cinefile.list_films.all
      @films_with_upcoming_screenings = []
      @other_films_in_cinefile = []
      @list_films.each do |list_film|
        @films.each do |film|
          if film.id == list_film.film_id
            if film.upcoming_screening?
              days = film.days_until_nearest_screening
              film_hash = {film: film, days: days}
              @films_with_upcoming_screenings << film_hash
            else
              @other_films_in_cinefile << film
            end
          end
        end
      end
      @films_with_upcoming_screenings.sort_by! { |hsh| hsh[:days] }
      @films_with_upcoming_screenings.map! { |film| film[:film] }
      @list_count = @films_with_upcoming_screenings.count
    end
  end

  def destroy
    @user = current_user
    @cinefile = @user.cinefile
    @list_film = ListFilm.find(params[:id])
    @film_id = @list_film.film_id
    @film = Film.find(@film_id)
    @list_film.destroy
    flash[:notice] = "'#{@film.title}' was successfully removed from your Cinefile"
    redirect_to user_cinefile_path(@user, @cinefile)
  end
end
