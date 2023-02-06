class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
  end
  # ユーザー退会機能
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_customers_path
  end

end
