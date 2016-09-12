class CreateScreenings < ActiveRecord::Migration
  def change
    create_table :screenings do |t|

      t.timestamps null: false
    end
  end
end
