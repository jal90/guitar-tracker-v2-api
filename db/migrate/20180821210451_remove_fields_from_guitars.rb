class RemoveFieldsFromGuitars < ActiveRecord::Migration[5.1]
  def change
    remove_column :guitars, :price
    remove_column :guitars, :year
    remove_column :guitars, :user_id
  end
end
