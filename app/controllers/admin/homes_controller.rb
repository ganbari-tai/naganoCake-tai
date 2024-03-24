class Admin::HomesController < ApplicationController
  before_action :authenticate_admin! #管理者以外に触らせたくないページに記述いて
  def top
    @orders = Order.all.page(params[:page]).per(6)
  end
end
