class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.string :username
      t.text :description
      t.integer :like

      t.timestamps
    end
  end
end
