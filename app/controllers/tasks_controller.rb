class TasksController < ApplicationController
  before_action :set_task!, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
          @task = Task.new
          @task.subtasks.build()
    end

    def create
        @task = Task.create(task_params)
        @task.user_id = session[:user_id]

        if @task.save
          redirect_to @task
        else
          render :new
        end
    end
  
    def show
    end

    def edit
    end
 
    def update
      @task.update(task_params)

      if @task.save
        redirect_to @task
      else
        render :edit
      end
    end
 
    def destroy
      @task.destroy
      flash[:notice] = "You have successfully deleted task."
      redirect_to @user
    end
   

    private
  
    def task_params
      params.require(:task).permit(:title, :deadline, :notes, :subtasks_attributes => {})
    end

    def set_task!
      @task = Task.find(params[:id])
    end
end
