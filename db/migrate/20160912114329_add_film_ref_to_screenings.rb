class AddFilmRefToScreenings < ActiveRecord::Migration
  def change
    add_reference :screenings, :film, index: true, foreign_key: true
  end
end
