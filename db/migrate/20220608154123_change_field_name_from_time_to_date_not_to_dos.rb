class ChangeFieldNameFromTimeToDateNotToDos < ActiveRecord::Migration[7.0]
  def change
    change_column :not_to_dos, :listdate, :date
  end
end