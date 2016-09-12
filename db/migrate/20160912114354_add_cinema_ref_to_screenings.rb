class AddCinemaRefToScreenings < ActiveRecord::Migration
  def change
    add_reference :screenings, :cinema, index: true, foreign_key: true
  end
end
