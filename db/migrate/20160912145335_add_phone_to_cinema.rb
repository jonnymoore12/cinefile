class AddPhoneToCinema < ActiveRecord::Migration
  def change
    add_column :cinemas, :phone, :integer
  end
end
