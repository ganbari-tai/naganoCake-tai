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
  end
end
