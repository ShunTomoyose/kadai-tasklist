class UsersController < ApplicationController
  def index
    @user = current_user
    unless @user
      redirect_to tasks_path
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
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザ登録完了'
      redirect_to new_session_path
    else
      flash.now[:danger] = 'ユーザ登録失敗'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
