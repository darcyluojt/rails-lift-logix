class CreateWorkouts < ActiveRecord::Migration[7.2]
  def change
    create_table :workouts do |t|
      t.references :split, null: false, foreign_key: true
      t.date :date
      t.boolean :done

      t.timestamps
    end
  end
end
