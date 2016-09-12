class ChangeIntegerLimitForPhoneInCinema < ActiveRecord::Migration
  def change
    change_column :cinemas, :phone, :integer, limit: 8
  end
end
