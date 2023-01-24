class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_item_path(params[:item_id])
  end
end
