class FilmsController < ApplicationController
  #
  # def new
  #   @user = current_user
  #   @cinefile = Cinefile.find(params[:cinefile_id])
  #   @film = Film.new
  # end
  #
 def create
   @film = Film.create(film_params)
redirect_to '/'
  #   @user = current_user
  #   @cinefile = Cinefile.find(params[:cinefile_id])
  #   @user.cinefile.films.create(film_params)
  #   redirect_to user_cinefile_path(@user.id, @cinefile.id)
 end
  #
  # def destroy
  #   @user = current_user
  #   @cinefile = Cinefile.find(params[:cinefile_id])
  #   @film = Film.find(params[:id])
  #   @film.destroy
  #   flash[:notice] = 'Film deleted successfully'
  #   redirect_to user_cinefile_path(@user.id, @cinefile.id)
  # end
  #
  # private
  #
  def film_params
    params[:film_record]
    
  end

end
