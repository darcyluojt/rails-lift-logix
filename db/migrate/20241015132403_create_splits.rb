class CreateSplits < ActiveRecord::Migration[7.2]
  def change
    create_table :splits do |t|
      t.references :programme, null: false, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
