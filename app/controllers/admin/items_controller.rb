class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "OK"
        redirect_to admin_items_path(@item)
      else
        flash.now[:notice] = "NG"
        render "new"
      end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        flash[:notice] = "OK"
        redirect_to admin_items_path(@item)
      else
        flash.now[:alert] = "NG"
        render "edit"
      end
  end
  
  def search
    @genres = Genre.all
    @genre_id  = params[:genre_id]
　　@items_search = Item.where(genre_id: @genre_id)
　　@items = Item.page(params[:page]).per(10)
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active)
  end
end
