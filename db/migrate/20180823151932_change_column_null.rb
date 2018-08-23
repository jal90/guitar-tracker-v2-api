class ChangeColumnNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :guitars, :make, false
    change_column_null :guitars, :model, false
  end
end
