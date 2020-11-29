class TasksController < ApplicationController

    def index
    end

    def new
        @task = Task.new
        #a task needs at least one subtask
        @task.subtasks.build()

    end

    def create
        @task = Task.create(task_params)
        @task.user_id = session[user_id]

        if @task.save
          redirect_to @task
        else
          render 'new'
        end

      end
  
      def show
       @task = Task.find(params[:id])
      end

      def edit
        @task = Task.find(params[:id])
     end
 
     def update
       @task = Task.find(params[:id])
       @task.update(task_params)
 
       if @task.save
         redirect_to @task
       else
         render :edit
       end
     end
 

     def destroy
       @task = Task.find(params[:id])
       @task.destroy
         # flash[:notice] = "Subtask deleted."
       redirect_to userhome_path()
     end
   

    private
  
    def task_params
      params.require(:task).permit(:title, :deadline, :notes, :subtasks_attributes => {})
    end
end
