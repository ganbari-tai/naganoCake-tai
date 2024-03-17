class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    redirect_to admin_items_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    redirect_to admin_items_path(@item)
  end
end
