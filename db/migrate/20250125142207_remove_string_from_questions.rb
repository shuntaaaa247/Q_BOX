class RemoveStringFromQuestions < ActiveRecord::Migration[8.0]
  def change
    remove_column :questions, :string, :string
    remove_column :questions, :text, :string
  end
end
