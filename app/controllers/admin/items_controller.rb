class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
  end

  def index
    if params[:genre].present?
      @items = Item.where(genre: params[:genre]).page(params[:page])
    elsif params[:weekday].present?
      @items = Item.where(weekday: params[:weekday]).page(params[:page])
    elsif params[:year].present?
      @items = Item.where(year: params[:year]).page(params[:page])
    else
      @items = Item.page(params[:page])
    end
     @years = Item.group(:year).order(:year).pluck(:year)
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
    params.require(:item).permit(:introduction, :name, :genre, :weekday, :url, :year)
  end
end
