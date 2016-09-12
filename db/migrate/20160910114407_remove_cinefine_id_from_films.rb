class RemoveCinefineIdFromFilms < ActiveRecord::Migration
  def change
    remove_reference :films, :cinefile, index: true, foreign_key: true
  end
end
