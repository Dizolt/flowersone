class AddPublishedColumnToFlower < ActiveRecord::Migration[5.0]
    def up
  	add_column :flowers, :published, :boolean, default: false
  end

  def down
  	remove_column :flowers, :published
  end
end
