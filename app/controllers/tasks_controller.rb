class TasksController < ApplicationController
    def new
        @task = Task.new
        # @task.subtasks.build()
    end
end
