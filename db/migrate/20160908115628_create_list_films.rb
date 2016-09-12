class CreateListFilms < ActiveRecord::Migration
  def change
    create_table :list_films do |t|

      t.timestamps null: false
    end
  end
end
