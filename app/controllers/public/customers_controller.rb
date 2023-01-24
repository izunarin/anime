class Public::CustomersController < ApplicationController
before_action :authenticate_customer!

  def likes
    @customer = Customer.find(params[:id])
    likes = Like.where(customer_id: @customer.id).pluck(:item_id)
    @like_items = Item.find(likes)
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer.id)
  end

    private

  def customer_params
    params.require(:customer).permit(:email, :name)
  end
end