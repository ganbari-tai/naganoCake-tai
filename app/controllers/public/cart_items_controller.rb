class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @amount = params[:amount]
  end
end
