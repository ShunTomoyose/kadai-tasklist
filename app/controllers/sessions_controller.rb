class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]

    puts('email = ' + email)
    puts('password = ' + password)
    
    if login(email, password)
      flash[:success] = 'ログイン成功'
      redirect_to root_path
    else
      flash.now[:danger] = 'ログイン失敗'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to tasks_path
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    # puts(@user)
    if @user && @user.authenticate(password)
      puts('session here')
      puts(session)
      session[:user_id] = @user.id
      puts(session)
      puts(session[:user_id])
      return true
    else
      return false
    end
  end
end
