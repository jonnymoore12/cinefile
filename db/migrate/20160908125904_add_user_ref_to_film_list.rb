class AddUserRefToFilmList < ActiveRecord::Migration
  def change
    add_reference :film_lists, :user, index: true, foreign_key: true
  end
end
