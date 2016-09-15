class RemoveTmdbIdFromScreenings < ActiveRecord::Migration
  def change
    remove_column :screenings, :tmdb_id, :string
  end
end
