class Film < ActiveRecord::Base
  has_many :cinefiles, through: :list_film
  has_many :list_films
  has_many :screenings
  has_many :cinemas, through: :screenings

  validates :tmdb_id, uniqueness: true

  def upcoming_screening?
    return true if upcoming_screenings_within_fortnight?
    return false
  end

  def upcoming_screenings_within_fortnight?
    @screenings = screenings.all
    screenings_within_the_fortnight = []
    @screenings.each do |screening|
      if  screening.screen_date < Time.now + 1209600 and screening.screen_date > Time.now
        screenings_within_the_fortnight << screening
      end
    end
    !screenings_within_the_fortnight.empty?
  end
end
