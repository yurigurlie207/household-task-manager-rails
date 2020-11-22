class TasksController < ApplicationController
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
        binding.pry
        render 'new' unless @task.save
  
        redirect_to @task
        # redirect_to '/users/' + user.id.to_s
      end
  
      def show
       @task = Task.find(params[:id])
      end

    private
  
    def task_params
      params.require(:task).permit(:title, :subtasks_attributes => {})
    end
end
