class Cinema < ActiveRecord::Base
  has_many :screenings, dependent: :destroy
  has_many :films, through: :screenings
end
