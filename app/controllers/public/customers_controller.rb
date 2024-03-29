class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash.now[:notice] = "編集に成功しました。"
      redirect_to customers_my_page_path
    else
      flash.now[:notice] = "編集に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash.now[:notice] = "退会処理が完了しました。ご利用ありがとうございました。"
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,
                                     :last_name_kana ,:first_name_kana,
                                     :postal_code,
                                     :address,
                                     :phone_number,
                                     :email,
                                     )
  end
end
