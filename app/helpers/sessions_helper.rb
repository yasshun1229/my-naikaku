module SessionsHelper
  def current_user # 現在ログインしているユーザを取得するメソッド
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in? # ユーザがログインしていればtrue、していなければfalseを返すメソッド
    !!current_user
  end
end
