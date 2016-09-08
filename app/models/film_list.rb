class FilmList < ActiveRecord::Base
  belongs_to :cinefile
  belongs_to :film
end
