# frozen_string_literal: true

class AddFieldsToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :guitars, :make, :string
    add_column :guitars, :model, :string
    add_column :guitars, :year, :integer
    add_column :guitars, :price, :integer

    add_column :setups, :string_brand, :string
    add_column :setups, :string_gauge, :decimal
    add_column :setups, :date_strings_changed, :date
    add_column :setups, :date_of_setup, :date
    add_column :setups, :setup_notes, :string
  end
end
