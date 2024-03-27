class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
    
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @customer = current_customer
    @addresses = @customer.addresses
    @address.customer_id = current_customer.id
    if @address.save
      flash.now[:notice] = "新規登録に成功しました。"
      redirect_to addresses_path
    else
      flash.now[:notice] = "新規登録に失敗しました。"
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash.now[:notice] = "編集に成功しました。"
      redirect_to addresses_path
    else 
      flash.now[:notice] = "編集に失敗しました。"
      render :edit
    end 
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code,:address,:name,:costomer_id)
  end

end