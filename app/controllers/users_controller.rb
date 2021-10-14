class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create] # ログインしていなければダメ
  before_action :correct_user, only: [:edit, :update, :destroy] # 自分しかダメ
  
  def show # ユーザの詳細ページのルーティング（今は無いが、将来的には必要になるので書いている。）
    @user = User.find(params[:id])
  end

  def new # ユーザ登録用フォームのルーティング
    @user = User.new
  end

  def create # ユーザ登録の処理
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy # ユーザを削除する機能（あとはボタンを追加するだけ）
    @user.destroy
    flash[:success] = "アカウントを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password) # name, email, passwordを許可
  end
  
  def correct_user
    @user = current_user.users.find_by(id: params[:id])
    unless @user
      redirect_to root_path
    end
  end
end