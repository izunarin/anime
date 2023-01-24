class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  def index
    if params[:genre].present?
      @items = Item.where(genre: params[:genre]).page(params[:page])
    elsif params[:weekday].present?
      @items = Item.where(weekday: params[:weekday]).page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end
end
