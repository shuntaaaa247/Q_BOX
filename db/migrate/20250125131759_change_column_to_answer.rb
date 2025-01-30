class ChangeColumnToAnswer < ActiveRecord::Migration[8.0]
  def change
    change_column_default(:answers, :like, from: nil, to: 0)
    change_column_null :answers, :description, false
    change_column_null :answers, :username, false
  end
end
