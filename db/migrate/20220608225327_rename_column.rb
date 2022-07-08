class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :trackers, :day21boolean, :day21
  end
end