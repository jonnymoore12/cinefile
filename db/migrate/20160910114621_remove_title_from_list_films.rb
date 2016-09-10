class RemoveTitleFromListFilms < ActiveRecord::Migration
  def change
    remove_column :list_films, :title, :string
  end
end
