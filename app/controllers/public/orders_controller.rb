class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    
  end

  def thanks
  end

  def create
    order = Order.new(order_params)
    order.save
    # 注文確認画面へリダイレクト
    redirect_to '/confirm'
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end
end
