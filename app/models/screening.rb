class Screening < ActiveRecord::Base
  belongs_to :film
  belongs_to :cinema
end
