class CreateFilmLists < ActiveRecord::Migration
  def change
    create_table :film_lists do |t|

      t.timestamps null: false
    end
  end
end
