class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :username, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
