class CreateSplitExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :split_exercises do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :split, null: false, foreign_key: true

      t.timestamps
    end
  end
end
