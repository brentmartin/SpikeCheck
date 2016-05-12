class CreateSelfevaluations < ActiveRecord::Migration
  def change
    create_table :selfevaluations do |t|
      t.float :answer
      t.boolean :completion
      t.belongs_to :survey, index: true, foreign_key: true
      t.belongs_to :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
