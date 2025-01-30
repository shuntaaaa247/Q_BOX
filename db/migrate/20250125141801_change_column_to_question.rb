class ChangeColumnToQuestion < ActiveRecord::Migration[8.0]
  def change
    change_column_null :questions, :username, false
    change_column_null :questions, :description, false
  end
end
