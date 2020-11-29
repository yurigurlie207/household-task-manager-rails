class Task < ApplicationRecord
    has_many :subtasks, dependent: :destroy
    has_many :users, :through => :subtasks
    accepts_nested_attributes_for :subtasks 

    validates :title, presence: true
    validates :notes, length: { maximum: 500 }
 
     validates :deadline, numericality: {
         greater_than_or_equal_to: Date.today.year,
         message: 'deadline must be today, or in the future'
     }

    # def subtasks_attributes=(subtasks_attributes)
    #     subtasks_attributes.each do |i,subtask_attributes|
    #         binding.pry
    #         self.subtasks.build(subtask_attributes)
    #     end
    # end

end
