class Cinefile < ActiveRecord::Base
  belongs_to :user
  has_many :list_films
  has_many :films, through: :list_film
end
