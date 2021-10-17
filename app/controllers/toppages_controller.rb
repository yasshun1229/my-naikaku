class ToppagesController < ApplicationController
  def index
    @cabinets = Cabinet.all
  end
end
