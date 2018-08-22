class AddUserGuitarToSetups < ActiveRecord::Migration[5.1]
  def change
    add_reference :setups, :user_guitars, foreign_key: true
  end
end
