class ChangeColumnFromStringToBoolean < ActiveRecord::Migration[7.0]
  def change
    change_column :trackers, :day21boolean, :boolean
  end
end