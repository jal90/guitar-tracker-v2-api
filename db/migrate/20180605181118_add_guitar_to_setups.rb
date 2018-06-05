class AddGuitarToSetups < ActiveRecord::Migration[5.1]
  def change
    add_reference :setups, :guitar, foreign_key: true
  end
end
