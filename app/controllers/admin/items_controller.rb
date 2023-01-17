class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page])
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
