class FilmsController < ApplicationController

  def new
    @user = current_user
    @cinefile = Cinefile.find(params[:cinefile_id])
    @film = Film.new
  end

  def create
    @user = current_user
    @cinefile = Cinefile.find(params[:cinefile_id])
    @user.cinefile.films.create(film_params)
    redirect_to user_cinefile_path(@user.id, @cinefile.id)
  end

  private

  def film_params
    params.require(:film).permit(:title)
  end

end
