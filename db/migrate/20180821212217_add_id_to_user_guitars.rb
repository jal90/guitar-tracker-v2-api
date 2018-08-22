class AddIdToUserGuitars < ActiveRecord::Migration[5.1]
  def change
    add_column :user_guitars, :id, :primary_key
  end
end
