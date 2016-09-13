class AddTmdbIdToScreenings < ActiveRecord::Migration
  def change
    add_column :screenings, :tmdb_id, :string
  end
end
