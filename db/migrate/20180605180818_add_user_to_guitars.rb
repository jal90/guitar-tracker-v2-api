class AddUserToGuitars < ActiveRecord::Migration[5.1]
  def change
    add_reference :guitars, :user, foreign_key: true
  end
end
