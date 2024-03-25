class Admin::GenresController < ApplicationController
  def index
    @genre_new = Genre.new
    @genres = Genre.all
    
  end

  def create
    @genre_new = Genre.new(genre_params)
    @genres = Genre.all
    if @genre_new.save
      flash[:notice] = "登録に成功しました。"
      redirect_to admin_genres_path
    else
      flash.now[:notice] = "登録に失敗しました。"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to admin_genres_path
    else
      flash.now[:notice] = "編集に失敗しました。"
      render :edit
    end
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
