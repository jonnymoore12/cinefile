class AddFilmRefToListFilm < ActiveRecord::Migration
  def change
    add_reference :list_films, :film, index: true, foreign_key: true
  end
end
