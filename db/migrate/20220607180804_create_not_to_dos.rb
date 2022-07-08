class CreateNotToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :not_to_dos do |t|
      t.time :listdate
      t.boolean :done
      t.string :name
      t.integer :position
      t.string :priority
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
