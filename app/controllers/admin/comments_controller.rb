class Admin::CommentsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end
  
  def show
   @customer = Customer.find(params[:id])
   @comment = Comment.find(params[:id])
   @item = Item.find(params[:id])
  end

  def destroy
  end
end
