class CinefileController < ApplicationController
  require "pry"

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
    @screenings = Screening.all
    @upcoming_screenings = []
    @screenings.each do |screening|
      if screening.screen_date < Time.now + 604800 and screening.screen_date > Time.now
        @upcoming_screenings << screening
      end
    end
    @user = current_user
    @cinefile = @user.cinefile
    @list_films = @cinefile.list_films.all
    @films_in_cinefile = []
    @list_films.each do |list_film|
      @films.each do |film|
        if film.id == list_film.film_id
          @films_in_cinefile << film
        end
      end
    end
  end
end
