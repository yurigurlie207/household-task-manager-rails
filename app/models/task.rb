class Task < ApplicationRecord
    has_many :subtasks, dependent: :destroy
    has_many :users, :through => :subtasks
    accepts_nested_attributes_for :subtasks 

    # def subtasks_attributes=(subtasks_attributes)
    #     subtasks_attributes.each do |i,subtask_attributes|
    #         binding.pry
    #         self.subtasks.build(subtask_attributes)
    #     end
    # end

end
