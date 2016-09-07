class Cinefile < ActiveRecord::Base
  belongs_to :user
  has_many :films
end
