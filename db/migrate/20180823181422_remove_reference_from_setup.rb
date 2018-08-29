class RemoveReferenceFromSetup < ActiveRecord::Migration[5.1]
  def change
    remove_reference :setups, :user_guitars, foreign_key: true
  end
end
