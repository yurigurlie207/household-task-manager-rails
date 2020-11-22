module SubtasksHelper
    def task_id_field(subtask)
        if subtask.task.nil?
        select_tag "subtask[task_id]", options_from_collection_for_select(Task.all, :id, :title)
        else
        hidden_field_tag "subtask[task_id]", subtask.task_id
        end
    end

    #return an array of usernames
    def list_users(subtask)
        usertasks = UserTask.where(subtask_id: subtask.id)
        usernames = []
        usertasks.each do |usertask|
            usernames << User.find_by(user_id: usertask.user_id)
        end
        binding.pry
     
      
    end
end
