class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_movies, :film_id, :movie_id
  end
end
