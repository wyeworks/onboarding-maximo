class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :description
      t.string :image_url
      t.date :date_add
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
