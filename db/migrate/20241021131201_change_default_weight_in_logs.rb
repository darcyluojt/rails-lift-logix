class ChangeDefaultWeightInLogs < ActiveRecord::Migration[7.2]
  def change
    change_column_default :logs, :weight, 0
  end
end
