module UserTasksHelper
    def incomplete_usertasks
        @usertasks = []
        Subtask.incomplete.each do |subtask|
            @usertasks << Usertask.where(subtask_id: subtask.id)
            binding.pry
        end

        
        return @usertasks
    end
end
