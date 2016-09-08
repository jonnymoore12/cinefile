class CinefileController < ApplicationController

  def index

  end

  def create
    @user = current_user
   if @user.cinefile.nil?
     @cinefile = Cinefile.create
     @user.cinefile = @cinefile
     @film_list = FilmList.create
     @user.cinefile.film_list = @film_list
   end
    redirect_to user_cinefile_path(@user.id, @user.cinefile.id)
  end

  def show
    @user = current_user
    @cinefile = @user.cinefile
    @film_list = @cinefile.film_list
  end

end
