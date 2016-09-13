class AddWebsiteToCinema < ActiveRecord::Migration
  def change
    add_column :cinemas, :website, :string
  end
end
