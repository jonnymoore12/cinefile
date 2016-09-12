class Cinema < ActiveRecord::Base
  has_many :screenings
  has_many :films, through: :screenings
end
