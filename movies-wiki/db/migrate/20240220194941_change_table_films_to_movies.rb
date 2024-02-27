class ChangeTableFilmsToMovies < ActiveRecord::Migration[7.1]
  def change
    rename_table :films, :movies
    rename_table :user_films, :user_movies
  end
end
