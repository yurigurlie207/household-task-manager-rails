class User < ApplicationRecord
   has_secure_password
   has_many :user_tasks
   has_many :subtasks, :through => :user_tasks
   has_many :tasks, :through => :subtasks

   

end
