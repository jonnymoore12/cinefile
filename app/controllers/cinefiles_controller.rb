class CinefilesController < ApplicationController

  def index
  end

  def new
    redirect_to 'cinefiles_path', method: :post
  end


end
