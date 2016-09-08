class AddFilmRefToFilmList < ActiveRecord::Migration
  def change
    add_reference :film_lists, :film, index: true, foreign_key: true
  end
end
