class CreateUserFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :user_films do |t|
      t.integer :user_id
      t.integer :film_id

      t.timestamps
    end
  end
end
