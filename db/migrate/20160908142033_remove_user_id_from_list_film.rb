class RemoveUserIdFromListFilm < ActiveRecord::Migration
  def change
    remove_reference :list_films, :user, index: true, foreign_key: true
  end
end
