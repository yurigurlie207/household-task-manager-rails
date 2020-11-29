module SubtasksHelper

    def estimated_select(subtask)
        select_tag "subtask[estimated_duration]", options_for_select(['5 minutes','15 minutes', '30 minutes', '45 minutes', '60 minutes'], '5 minutes')
    end

    def actual_select(subtask)
        select_tag "subtask[actual_duration]", options_for_select(['5 minutes','10 minutes','30 minutes', '45 minutes', '60 minutes'], '5 minutes')
    end

    def priority_select(subtask)
        select_tag "subtask[priority]", options_for_select(['low', 'medium', 'high'], 'medium')
    end

    # def task_id_field(subtask)
    #     if subtask.task.nil?
    #     select_tag "subtask[task_id]", options_from_collection_for_select(Task.all, :id, :title)
    #     else
    #     hidden_field_tag "subtask[task_id]", subtask.task_id
    #     end
    # end

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
