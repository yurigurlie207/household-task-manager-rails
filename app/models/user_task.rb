class UserTask < ApplicationRecord
    belong_to :subtasks
    belong_to :users
end
