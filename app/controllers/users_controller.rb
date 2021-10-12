class UsersController < ApplicationController
  def show # ユーザの詳細ページのルーティング
    @user = User.find(params[:id])
  end

  def new # ユーザ登録用フォームのルーティング
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end
  
  def destroy # ユーザを削除する機能
    find_user_id
    @user.destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password) # name, email, passwordを許可
  end
end
