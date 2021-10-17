class CabinetsController < ApplicationController
  before_action :require_user_logged_in # ログインしていなければダメ
  before_action :correct_user, only: [:edit, :update, :destroy] # 自分しかダメ
  before_action :cabinet_find, only: [:show]
  
  def index
    @cabinets = current_user.cabinets.order(id: :desc)
  end
  
  def show 
  end
  
  def new
    @cabinet = Cabinet.new
  end

  def create
    @cabinet = current_user.cabinets.build(cabinet_params)
    if @cabinet.save
      flash[:success] = "組閣しました"
      redirect_to cabinets_path
    else
      @pagy, @cabinets = pagy(current_user.cabinets.order(id: :desc))
      flash.now[:danger] = "組閣することができませんでした"
      render :new
    end
  end

  def edit
    @cabinet = Cabinet.find(params[:id])
  end

  def update
    @cabinet = current_user.cabinets.find(params[:id])
    
    if @cabinet.update(cabinet_params)
      flash[:success] = "#{@cabinet.title_cabinet} は更新されました"
      redirect_to @cabinet
    else
      flash.now[:danger] = "内閣の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @cabinet.destroy
    flash[:success] = "内閣を削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def cabinet_params
    params.require(:cabinet).permit(:title_cabinet, :prime_minister_name, :chief_cabinet_secretary_name, :finance_minister_name, :comprehensive_minister_name, :economy_minister_name, :education_minister_name, :welfare_minister_name, :diplomacy_minister_name, :defense_minister_name, :agriculture_minister_name, :traffic_minister_name, :law_minister_name, :green_minister_name, :digital_minister_name, :reconstruction_minister_name, :public_security_minister_name)
  end
  
  def correct_user
    @cabinet = current_user.cabinets.find_by(id: params[:id]) # id:ログイン中ユーザのcabinetsテーブルから
    unless @cabinet
      redirect_to root_path
    end
  end
  
  def cabinet_find
    @cabinet = Cabinet.find(params[:id])
  end
end