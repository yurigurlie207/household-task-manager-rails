class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :estimated_duration
      t.date :deadline
      t.string :priority
      t.text :notes
      t.boolean :no_subtask
      t.boolean :complete
      add_reference :tasks, :subtask, index:true, foreign_key: true
      t.timestamps null: false
    end
  end
end
