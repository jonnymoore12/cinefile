class AddAddressToCinema < ActiveRecord::Migration
  def change
    add_column :cinemas, :address, :string
  end
end
