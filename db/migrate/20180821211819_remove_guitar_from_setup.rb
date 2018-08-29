class RemoveGuitarFromSetup < ActiveRecord::Migration[5.1]
  def change
    remove_column :setups, :guitar_id
  end
end
