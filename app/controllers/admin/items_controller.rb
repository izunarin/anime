class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    if params[:genre].present?
      @items = Item.where(genre: params[:genre]).page(params[:page])
    elsif params[:weekday].present?
      @items = Item.where(weekday: params[:weekday]).page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

    private

  def item_params
    params.require(:item).permit(:introduction, :name, :genre, :weekday, :url)
  end
end
