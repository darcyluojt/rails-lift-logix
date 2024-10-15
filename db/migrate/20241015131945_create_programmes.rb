class CreateProgrammes < ActiveRecord::Migration[7.2]
  def change
    create_table :programmes do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :weeks
      t.integer :splits_per_week

      t.timestamps
    end
  end
end
