class AddDateToScreening < ActiveRecord::Migration
  def change
    add_column :screenings, :screen_date, :date
  end
end
