class SubtasksController < ApplicationController
    def new
        @subtask = Task.new
    end

    def create
        @task = Task.new(subtask_params)
    end

    private
  
    # def subtask_params
    #   params.require(:subtask).permit(:title, subtask_attributes)
    # end
end
