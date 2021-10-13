class ToppagesController < ApplicationController
  def index
    if logged_in?
      @cabinet = current_user.cabinets.build # form_with 用
      @pagy, @cabinets = pagy(current_user.cabinets.order(id: :desc))
    end
  end
end
