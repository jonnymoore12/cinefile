class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
