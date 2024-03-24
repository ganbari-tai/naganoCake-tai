class Public::ItemsController < ApplicationController
  
  def index
    @items_all = Item.all
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @image = @item.image
    @genres = Genre.all
    #@cart_item = CartItem.new
  end
  
  def search
    @genres = Genre.all
    @genre_id = params[:genre_id]
    @items_search = Item.where(genre_id: @genre_id)
    @items = Item.page(params[:page]).per(10)
  end
end
  
