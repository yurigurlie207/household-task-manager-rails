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
        # @task = Task.new()
        # @task.title = params[:task][:title]
        # @task.subtasks_attributes=(params[:task][:subtasks_attributes])
        # binding.pry
        render 'new' unless @task.save
  
        redirect_to @task
        # redirect_to '/users/' + user.id.to_s
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
      params.require(:task).permit(:title, :subtasks_attributes => {})
    end
end
