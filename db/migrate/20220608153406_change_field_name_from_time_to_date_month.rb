class ChangeFieldNameFromTimeToDateMonth < ActiveRecord::Migration[7.0]
  def change
    change_column :trackers, :habitdate, :date
  end
end