class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def task_params
    # whitelists the attributes a user can give in the form (for security)
    params.require(:task).permit(:title, :details, :completed)
  end

end
