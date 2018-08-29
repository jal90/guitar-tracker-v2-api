class AddReferenceToSetup < ActiveRecord::Migration[5.1]
  def change
    add_reference :setups, :user_guitar, foreign_key: true
  end
end
