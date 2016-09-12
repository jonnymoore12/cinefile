class Film < ActiveRecord::Base
  has_many :cinefiles, through: :list_film
  has_many :list_films
  has_many :screenings
  has_many :cinemas, through: :screenings

  validates :tmdb_id, uniqueness: true
end
