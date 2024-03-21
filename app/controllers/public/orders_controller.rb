class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_selection] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    elsif params[:order][:address_selection] == "1"
      @address = Address.find(params[:order][:address_selection])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_selection] == "2"
      @order.customer_id = current_customer.id
    end 
    
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
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
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :status, :customer_id, :total_payment, :shipping_cost)
  end
end
