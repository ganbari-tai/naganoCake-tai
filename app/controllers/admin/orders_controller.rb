class Admin::OrdersController < ApplicationController
  
  def show
    # @custommer = Customer.find(params[:id])
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update
    redirect_to admin_order_path
  end

end
