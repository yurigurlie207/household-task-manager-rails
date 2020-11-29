class AddUsertoTask < ActiveRecord::Migration[6.0]
  def change
    def change
      add_reference :tasks, :user, index: true, foreign_key: true
    end
  end
end
