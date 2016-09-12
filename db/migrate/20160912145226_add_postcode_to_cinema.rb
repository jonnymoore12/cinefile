class AddPostcodeToCinema < ActiveRecord::Migration
  def change
    add_column :cinemas, :postcode, :string
  end
end
