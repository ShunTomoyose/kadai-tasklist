class UsersController < ApplicationController
  def index
    @user = current_user
    unless @user
      redirect_to new_task_path
    end
  end

  def show
    # ユーザのマイページ的な
    # いる？？
    
  end

  def new
    # ユーザ登録用のフォーム
    @user = User.new
  end

  def create
    # ユーザ登録のpostを受けとってDBに新規レコードを追加

  end
end
