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
    @cart_item = CartItem.new
  end
  
  def search
    @genre_list = Genre.all
    @genre = Genre.find(params[:genre_id])
    @items = @genre.items.all#page(params[:page]).per(8)
  end
end
  
