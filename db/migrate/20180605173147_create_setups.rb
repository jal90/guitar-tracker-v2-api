class CreateSetups < ActiveRecord::Migration[5.1]
  def change
    create_table :setups do |t|

      t.timestamps
    end
  end
end
