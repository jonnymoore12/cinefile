class CinemasController < ApplicationController

  def index
    @cinemas =Cinema.all
  end

  def new
    @cinema = Cinema.new
  end

  def create
    @cinema = Cinema.create(cinema_params)
    redirect_to cinemas_path
  end

  def show
    @cinema = Cinema.find(params[:id])
  end

  def edit
    @cinema = Cinema.find(params[:id])
  end

  def update
    @cinema = Cinema.find(params[:id])
    @cinema.update(cinema_params)
    redirect_to cinemas_path
  end

  def destroy
    @cinema = Cinema.find(params[:id])
    @cinema.destroy
    flash[:notice] = 'Cinema deleted successfully'
    redirect_to cinemas_path
  end

private

  def cinema_params
    params.require(:cinema).permit(:name, :address, :postcode, :phone, :website)
  end
end
