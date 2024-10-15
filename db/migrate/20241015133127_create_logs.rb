class CreateLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :logs do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :split_exercise, null: false, foreign_key: true
      t.decimal :weight
      t.integer :repetitions

      t.timestamps
    end
  end
end
