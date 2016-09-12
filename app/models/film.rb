class Film < ActiveRecord::Base
  has_many :cinefiles, through: :list_film
  has_many :list_films

  validates :tmdb_id, uniqueness: true
end
