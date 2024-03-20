class Admin::OrderDetailsController < ApplicationController

  def update
    @order_details = OrderDetails.find(params[:id])
    @order_details.update
    redirect_to admin_order_path
  end
  
end
