class Admin::OrdersController < ApplicationController

  def show
    # @custommer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])
    @order_items = @order.order_details.all
    @order_details = @order.order_details.all
    @shipping_cost = 800

  end

  def update
   @order = Order.find(params[:id])
   @order_details = @order.order_details
   if @order.update(order_params)
     flash.now[:notice] = "変更に成功しました。"
     @order_details.update_all(making_status: "waiting_making") if @order.status == "payment"
   end
   flash.now[:notice] = "変更に失敗しました。"
   redirect_to admin_order_path(@order)

  end

  private
  def order_params
     params.require(:order).permit(:status)

  end
end
