class Film < ActiveRecord::Base

  has_many :cinefiles, through: :list_film
  has_many :list_films


end
