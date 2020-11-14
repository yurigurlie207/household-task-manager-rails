class Task < ApplicationRecord
    has_many :subtasks
    has_many :users, :through => :subtasks
    accepts_nested_attributes_for :subtasks

    def subtasks_attributes=(subtasks_attributes)
        self.subtasks.build(subtasks_attributes)
    end

end
