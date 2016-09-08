class AddCinefileRefToFilmList < ActiveRecord::Migration
  def change
    add_reference :film_lists, :cinefile, index: true, foreign_key: true
  end
end
