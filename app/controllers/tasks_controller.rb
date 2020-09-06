class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @status = ['todo', 'doing', 'done']
  end
  
  def new
    @task = Task.new
    @status = ['todo', 'doing', 'done']
  end
  
  def create
    @task = Task.create(task_params)
    @status = ['todo', 'doing', 'done']
    redirect_to tasks_path
  end
  
  def edit
    @task = Task.find(params[:id])
    @status = ['todo', 'doing', 'done']
    
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @status = ['todo', 'doing', 'done']
    redirect_to tasks_path
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  private
    def task_params
      params.require(:task).permit(:title,:state)
    end
end
