class ListFilmsController < ApplicationController

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
