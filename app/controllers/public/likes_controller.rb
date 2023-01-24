class Public::LikesController < ApplicationController
  before_action :authenticate_customer!
  def create
    item = Item.find(params[:item_id])
    like = current_customer.likes.new(item_id: item.id)
    like.save
    redirect_to public_item_path(item)
  end

  def destroy
    item = Item.find(params[:item_id])
    like = current_customer.likes.find_by(item_id: item.id)
    like.destroy
    redirect_to public_item_path(item)
  end
end
