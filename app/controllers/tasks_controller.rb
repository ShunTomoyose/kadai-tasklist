class TasksController < ApplicationController
  # task#indexアクション以外は事前にログインが必要
  # indexアクションに対してはviews/tasks/index.html.etbを表示させたいのでonlyで対象外アクションとしている
  before_action :require_user_logged_in, only: [:show, :new, :create, :edit, :update, :destroy]
  
  # タスク削除を行うときにはユーザの整合性を確認している？？？
  before_action :correct_user, only: [:show, :edit, :update, :destroy] 
  
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
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order('created_at desc')
      p(@tasks)
      flash.now[:danger] = '失敗です'
      render new_task_path
    end
    
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      flash[:danger] = '操作対象外です'
      redirect_to root_url
    end
  end
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end
