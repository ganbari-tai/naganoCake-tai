class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(4)
     @genres = Genre.all
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
    else
      @items = Item.all
    end
  end

  def about
  end
end
