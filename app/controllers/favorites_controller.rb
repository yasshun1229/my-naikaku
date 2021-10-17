class FavoritesController < ApplicationController
  before_action :require_user_logged_in # ログイン中

  def index
    if logged_in?
      @cabinet = current_user.cabinets.build
      @pagy, @cabinets = pagy(current_user.feed_cabinets.order(id: :desc))
    end
  end
  
  def create
    cabinet = Cabinet.find(params[:cabinet_id])
    current_user.like(cabinet)
    flash[:success] = "Cabinetをお気に入り登録しました"
    redirect_to current_user
  end

  def destroy
    cabinet = Cabinet.find(params[:cabinet_id])
    current_user.unlike(cabinet)
    flash[:success] = "Cabinetのお気に入り登録を解除しました"
    redirect_to current_user
  end
end
