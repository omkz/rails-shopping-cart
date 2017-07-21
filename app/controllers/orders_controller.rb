class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def checkout
    @order = current_order
  end

  def update
    @order.update(order_params)
    session[:order_id] = nil
    redirect_to root_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(session[:order_id])
  end

  # Only allow a trusted parameter "white list" through.
  def order_params
    params.require(:order).permit(:tax, :subtotal, :total, :first_name, :last_name, :address, :email)
  end

end
