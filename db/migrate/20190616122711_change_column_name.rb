class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :habits, :summary, :goal
    rename_column :habits, :type, :category
  end
end
