class AddCinefileRefToFilms < ActiveRecord::Migration
  def change
    add_reference :films, :cinefile, index: true, foreign_key: true
  end
end
