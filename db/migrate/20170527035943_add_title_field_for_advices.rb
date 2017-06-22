class AddTitleFieldForAdvices < ActiveRecord::Migration[5.0]
  def change
  	add_column    :advices, :title, :string
  	remove_column :flowers, :published
  end
end
