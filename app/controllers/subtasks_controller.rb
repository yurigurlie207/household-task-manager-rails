class SubtasksController < ApplicationController
    def new
        @subtask = Subtask.new(task_id: params[:task_id])
      
    end

    def create
        @subtask = Subtask.new(subtask_params)

        if @subtask.save
          redirect_to @subtask
        else
          render :new
        end
    end
    
    def show
        @subtask = Subtask.find(params[:id])
    end

    private
  
    def subtask_params
      params.require(:subtask).permit(:title, :task_id)
    end
end
