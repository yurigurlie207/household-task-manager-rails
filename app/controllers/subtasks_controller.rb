class SubtasksController < ApplicationController

    private
  
    def subtask_params
      params.require(:subtask).permit(:title)
    end
end
