module SubtasksHelper
    def task_id_field(subtask)
        if subtask.task.nil?
        select_tag "subtask[task_id]", options_from_collection_for_select(Task.all, :id, :title)
        else
        hidden_field_tag "subtask[task_id]", subtask.task_id
        end
    end

    #return an array of usernames, only if there are users assigned
    def list_users(subtask)
        usertasks = UserTask.where(subtask_id: subtask.id)
        if usertasks
            usernames = usertasks.collect do |usertask|
                User.find_by(id: usertask.user_id).username
            end
           
        else
            ["No Users Assigned"]
        end
    end
end
