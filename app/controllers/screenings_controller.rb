class ScreeningsController < ApplicationController
  require "pry"
  def index
  end

  def new
    @cinema = Cinema.find(params[:cinema_id])
    @screening = Screening.new
    @film = Film.new
    @films = Film.all
  end

  def create
    @film = Film.find(params[:film_id])
    @cinema = Cinema.find(params[:cinema_id])
    @date = screening_params[:screen_date]
    @time = screening_params[:screen_time]
    @screening = Screening.create(film_id: @film.id, cinema_id: @cinema.id, screen_date: @date, screen_time: @time)
    redirect_to cinema_path(@cinema)
  end

  def show
    @cinema = Cinema.find(params[:cinema_id])
    @screening = Screening.find(params[:id])
  end

  def destroy
    @cinema = Cinema.find(params[:cinema_id])
    @screening = Screening.find(params[:id])
    @screening.destroy
    flash[:notice] = 'Screening deleted successfully'
    redirect_to cinema_path(@cinema)
  end

  def show_screenings_for_film
    @film = Film.find(params[:film_id])
    @screenings = @film.screenings.all
    @cinemas = Cinema.all
    render '/screenings/show_screenings_for_film.html.erb'
  end

  private

  def screening_params
    params.require(:screening).permit(:film_id, :screen_date, :screen_time)
  end
end
