class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :type_ci
      t.string :ci
      t.date :birth_date

      t.timestamps
    end
  end
end
