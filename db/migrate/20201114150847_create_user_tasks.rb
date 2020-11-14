class CreateUserTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tasks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :subtask, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
