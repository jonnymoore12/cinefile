class Film < ActiveRecord::Base
  has_many :cinefiles, through: :list_film
  has_many :list_films
  has_many :screenings
  has_many :cinemas, through: :screenings

  validates :tmdb_id, uniqueness: true

  def upcoming_screening?
    return true if days_until_nearest_screening && screenings_within_the_fortnight?
    return false
  end

  def days_until_nearest_screening
    @array_of_days_until_screenings = screenings.all.map { |screening| screening.screen_date.day - Time.now.day }
    @array_of_days_until_screenings.min
  end

private

  def screenings_within_the_fortnight?
    days_until_nearest_screening.between?(0, 14)
  end
end
