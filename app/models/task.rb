class Task < ApplicationRecord
    has_many :subtasks
    has_many :users, :through => :subtasks
    
end
