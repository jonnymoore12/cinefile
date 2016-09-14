class ChangeDatatypeForCinemaPhone < ActiveRecord::Migration
  def change
    change_column :cinemas, :phone, :string
  end
end
