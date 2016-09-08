class Film < ActiveRecord::Base

  belongs_to :cinefile, through: :film_list 

end
