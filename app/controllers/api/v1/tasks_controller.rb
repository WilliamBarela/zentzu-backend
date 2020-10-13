class Api::V1::TasksController < ApplicationController
  def create
  end

  def destroy
  end

  private
  
  def task_params
    params.require(:task).permit(:description, :date, :priority, :person_id)
  end
end
