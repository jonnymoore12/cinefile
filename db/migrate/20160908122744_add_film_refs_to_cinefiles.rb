class AddFilmRefsToCinefiles < ActiveRecord::Migration
  def change
    add_reference :cinefiles, :film, index: true, foreign_key: true
  end
end
