class DropMovies < ActiveRecord::Migration[7.1]
  def change
    drop_table :movies
  end
end
