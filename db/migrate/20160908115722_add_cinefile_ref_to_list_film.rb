class AddCinefileRefToListFilm < ActiveRecord::Migration
  def change
    add_reference :list_films, :cinefile, index: true, foreign_key: true
  end
end
