class ScreeningsController < ApplicationController

  def new
    @cinema = Cinema.find(params[:cinema_id])
    @screening = Screening.new
    @film = Film.new
    @films = Film.all
  end

  def create
    @film = Film.find(params[:film_id])
    @cinema = Cinema.find(params[:cinema_id])
    @date = params[:screen_date]
    @time = params[:screen_time]
    @screening = Screening.create(film_id: @film.id, cinema_id: @cinema.id, screen_date: @date, screen_time: @time)
    redirect_to cinema_path(@cinema)
  end

  private

  def screening_params
    params.require(:screening).permit(:film_id, :screen_date, :screen_time)
  end
end
