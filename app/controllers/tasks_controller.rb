class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def index
    @tasks = current_user.tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])

    @task.update!(task_params)
    redirect_to @task
  end

  def destroy
    @task = current_user.tasks.find(params[:id])

    if @task.destroy
      redirect_to tasks_path
    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :text)
  end
end
