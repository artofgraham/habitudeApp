class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.time :cdate
      t.string :name
      t.boolean :check
      t.integer :position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
