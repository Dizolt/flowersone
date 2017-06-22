class AddAvailabilityToBouquets < ActiveRecord::Migration[5.0]
  def change
  	add_column :bouquets, :availability, :integer
  end
end
