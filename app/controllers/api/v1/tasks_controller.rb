class Api::V1::TasksController < ApplicationController
  def create
    person = Person.find(task_params.person_id)
    task = person.tasks.build(task_params)

    if task.save
      messages = ["Task saved!"]
      # render json: { message: { index_array(messages) } }, status: :accepted
      render json: { :message => index_array(messages) }, status: :accepted
    else
      # render json: { errors: { index_array(task.errors.full_messages) } }, status: :accepted
      render json: { :errors => index_array(task.errors.full_messages) }, status: :accepted
    end
  end

  def destroy
  end

  private
  
  def task_params
    params.require(:task).permit(:description, :date, :priority, :person_id)
  end
end
