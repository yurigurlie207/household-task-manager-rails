class SubtasksController < ApplicationController
  
    def index
    end

    def new
        @subtask = Subtask.new(task_id: params[:task_id])
    end

    def create
        @subtask = Subtask.create(subtask_params.except(:user_ids))
      #   binding.pry
        if subtask_params[:user_ids].count >= 2
          @subtask.user_ids = subtask_params[:user_ids]
          redirect_to @subtask
        else
          if subtask_params[:user_ids].count == 1
            @subtask.errors[:base] << "Need to assign at least one user" 
          end
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

      if subtask_params[:user_ids].count == 1 || !@subtask.update(subtask_params)
         @subtask.errors[:base] << "Need to assign at least one user" 
         render :edit
      else
        redirect_to @subtask
      end
    end


    def destroy
      @subtask = Subtask.find(params[:id])
      @task = @subtask.task
      @subtask.destroy
        # flash[:notice] = "Subtask deleted."
      redirect_to task_path(@task)
    end
  

    private
  
    def subtask_params
      params.require(:subtask).permit(:title, :task_id, :user_ids => [])
    end
end
