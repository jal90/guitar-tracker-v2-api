class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :guitars do |t|
      t.index :user_id
      t.index :guitar_id
      t.integer :year
      t.integer :price
    end
  end
end
