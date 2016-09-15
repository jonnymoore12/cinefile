class AddUserRefToCinefiles < ActiveRecord::Migration
  def change
    add_reference :cinefiles, :user, index: true, foreign_key: true
  end
end
