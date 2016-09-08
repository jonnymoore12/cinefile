class Cinefile < ActiveRecord::Base
  belongs_to :user
  has_one :film_list
  has_many :films, through: :film_list
end
