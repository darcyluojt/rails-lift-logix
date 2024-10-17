class AddImageUrlToExercise < ActiveRecord::Migration[7.2]
  def change
    add_column :exercises, :image_url, :text
  end
end
