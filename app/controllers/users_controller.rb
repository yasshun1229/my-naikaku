class UsersController < ApplicationController

  def show
  end

  def new
  end

  def create
  end
  
  def destroy # ユーザを削除する機能
    find_user_id
    @user.destroy
  end
end
