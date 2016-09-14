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

  def days_until_nearest_screening
    @array_of_days_until_screenings = screenings.all.map { |screening| screening.screen_date.day - Time.now.day }
    @array_of_days_until_screenings.min
  end

private

  def upcoming_screenings_within_fortnight?
    @screenings = screenings.all
    screenings_within_the_fortnight = []
    @screenings.each do |screening|
      if screening.screen_date < Time.now + 1209600 && screening.screen_date > Time.now
        screenings_within_the_fortnight << screening
      end
    end
    !screenings_within_the_fortnight.empty?
  end

end
