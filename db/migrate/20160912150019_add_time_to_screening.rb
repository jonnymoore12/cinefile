class AddTimeToScreening < ActiveRecord::Migration
  def change
    add_column :screenings, :screen_time, :time
  end
end
