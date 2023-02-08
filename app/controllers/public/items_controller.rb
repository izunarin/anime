class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
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

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end
end
