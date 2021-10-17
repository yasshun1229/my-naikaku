class ToppagesController < ApplicationController
  def index
    @cabinets = Cabinet.all
    if logged_in?
      @cabinet = current_user.cabinets.build
      @pagy, @cabinets = pagy(current_user.cabinets.order(id: :desc))
    end
  end
end
