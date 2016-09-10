class AddUserRefToListFilm < ActiveRecord::Migration
  def change
    add_reference :list_films, :user, index: true, foreign_key: true
  end
end
