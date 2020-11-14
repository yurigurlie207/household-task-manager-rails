class Task < ApplicationRecord
    has_many :subtasks
    has_many :users, :through => :subtasks
    # accepts_nested_attributes_for :subtasks (THIS IS RAILS MICRO FOR BELOW METHOD)

    def subtasks_attributes=(subtasks_attributes)
        subtasks_attributes.each do |i, subtask_attributes|
            self.subtasks.build(subtask_attributes)
        end
    end

end
