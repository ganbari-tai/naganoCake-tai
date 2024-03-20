class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
    
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
  end

  def destroy
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code,:address,:name,:costomer_id)
  end

end