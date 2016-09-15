class AddPosterPathToFilm < ActiveRecord::Migration
  def change
    add_column :films, :poster_path, :string
  end
end
