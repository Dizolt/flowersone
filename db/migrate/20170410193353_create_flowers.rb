class CreateFlowers < ActiveRecord::Migration[5.0]
  def change
    create_table :flowers do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :availability
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
