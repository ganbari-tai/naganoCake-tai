class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer_page = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      render :edit
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,
                                     :last_name_kana ,:first_name_kana,
                                     :postal_code,
                                     :address,
                                     :phone_number,
                                     :email,
                                     :is_active
                                     )
  end
end
