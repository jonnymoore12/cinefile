class RemoveFilmRefFromCinefile < ActiveRecord::Migration
  def change
    remove_reference :cinefiles, :film, index: true, foreign_key: true
  end
end
