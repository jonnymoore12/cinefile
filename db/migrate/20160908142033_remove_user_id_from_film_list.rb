class RemoveUserIdFromFilmList < ActiveRecord::Migration
  def change
    remove_reference :film_lists, :user, index: true, foreign_key: true
  end
end
