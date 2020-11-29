class Task < ApplicationRecord
    has_many :subtasks, dependent: :destroy
    has_many :users, :through => :subtasks
    accepts_nested_attributes_for :subtasks 

    validates :title, presence: true
    validates :notes, length: { maximum: 500 }
 
     validates :deadline, date: { on_or_after: Proc.new { Time.now } }

    # def subtasks_attributes=(subtasks_attributes)
    #     subtasks_attributes.each do |i,subtask_attributes|
    #         binding.pry
    #         self.subtasks.build(subtask_attributes)
    #     end
    # end

end
