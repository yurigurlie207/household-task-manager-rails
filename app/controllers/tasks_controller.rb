class TasksController < ApplicationController
    def new
        @task = Task.new
        # @task.subtasks.build()
    end

    def create
        @task = Task.create(task_params)
        render 'new' unless @task.save
  
        redirect_to @task
        # redirect_to '/users/' + user.id.to_s
      end
  
      def show
       @task = Task.find(params[:id])
      end

    private
  
    def task_params
      params.require(:task).permit(:title)
    end
end
