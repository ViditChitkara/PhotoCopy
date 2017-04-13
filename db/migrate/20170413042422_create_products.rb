class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :branch
      t.integer :year
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
