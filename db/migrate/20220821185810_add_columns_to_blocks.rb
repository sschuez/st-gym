class AddColumnsToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :repetitions, :integer, default: 1
    add_column :blocks, :time, :integer, default: 600
    add_column :blocks, :title, :string
    add_column :blocks, :tabata, :boolean, default: false
  end
end
