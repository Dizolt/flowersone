class AddTitleFieldForBouquets < ActiveRecord::Migration[5.0]
  def change
  	add_column :bouquets, :title, :string
  end
end
