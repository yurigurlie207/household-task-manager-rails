class UserTasksController < ApplicationController
  
    def index
        @usertasks = UserTask.all
    end

    def edit
    end

    def update
        @usertask = UserTask.find(params[:id])
        @usertask.update(usertask_params)

      if @usertask.save
        redirect_to @usertask.subtask
      else
        render :edit
      end
    end


    private 

    def usertask_params
        params.require(:usertask).permit(:comment)
    end  
 
end
