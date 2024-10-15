class CreateExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :category_array, array: true, default: []

      t.timestamps
    end
  end
end
