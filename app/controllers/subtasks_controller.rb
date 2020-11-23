class SubtasksController < ApplicationController
  
    def index
    end

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

    def edit
       @subtask = Subtask.find(params[:id])
    end

    def update
      @subtask = Subtask.find(params[:id])

      @subtask.update(subtask_params)

      if @subtask.save
        redirect_to @subtask
      else
        render :edit
      end
    end

    private
  
    def subtask_params
      params.require(:subtask).permit(:title, :task_id, :user_ids => [])
    end
end
