class ChangeJointableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :guitars_users, :user_guitars
  end
end
