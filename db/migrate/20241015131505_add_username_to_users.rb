class AddUsernameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :username, :string
    add_column :users, :weight, :decimal
    add_column :users, :height, :decimal
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :fitness_level, :string
    add_column :users, :fitness_goal, :string
  end
end
