class RenameColummFromDaysToIntention < ActiveRecord::Migration[7.0]
  def change
    rename_column :trackers, :days, :intention
  end
end