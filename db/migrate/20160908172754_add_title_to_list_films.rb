class AddTitleToListFilms < ActiveRecord::Migration
  def change
    add_column :list_films, :title, :string
  end
end
