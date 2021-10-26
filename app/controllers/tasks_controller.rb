class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task, success: "作成に成功しました"
    else
      flash.now[:danger] = "作成に失敗しました"
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

    if @task.update(task_params)
      redirect_to @task, success: "変更に成功しました"
    else
      flash.now[:danger] = "変更に失敗しました"
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])

    @task.destroy
    redirect_to tasks_path, success: "削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:title, :text)
  end
end
