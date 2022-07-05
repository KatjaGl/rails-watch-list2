class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:edit, :update, :destroy]
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @list = Bookmark.list
  end

  def update
    @list = @bookmark.list
    @bookmark.update(params[:comment])
    @bookmark.save ? (redirect_to list_path(@list)) : (render :new)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:commit, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
