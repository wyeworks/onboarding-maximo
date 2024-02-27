class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.string :title
      t.string :genre
      t.integer :score
      t.string :cast_id
      t.string :director_id
      t.string :source_id
      t.date :release_date
      t.timestamps
    end
  end
end
