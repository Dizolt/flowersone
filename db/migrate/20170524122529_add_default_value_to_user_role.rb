class AddDefaultValueToUserRole < ActiveRecord::Migration[5.0]
  def up
  	change_column_default(:users, :role, 0)
  end

  def down
  	change_column :users, :role
  end
end
