class Task < ApplicationRecord
    has_many :subtasks, dependent: :destroy
    has_many :users, :through => :subtasks
    # accepts_nested_attributes_for :subtasks 

    validates :title, presence: true
    validates :notes, length: { maximum: 500 }
 
    validates :deadline, date: { on_or_after: Proc.new { Time.now } }

    def subtasks_attributes=(subtasks_attributes)
        subtasks_attributes.each do |i,subtask_attribute|
            # binding.pry
            subtask = self.subtasks.build(subtask_attribute.except(:user_ids))
            subtask.user_ids = subtask_attribute[:user_ids]
           binding.pry
        end
    end

end
