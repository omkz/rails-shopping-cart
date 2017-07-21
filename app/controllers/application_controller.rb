class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order, :current_order_items

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_order_items
    if !session[:order_id].nil?
      order = Order.find(session[:order_id])
      order.order_items.map { |oi| oi.valid? ? (oi.quantity ) : 0 }.sum
    else
       0
    end
    # if !order.order_items
    #   "tela"
    # else
    #   order.order_items.map(&:quantity).sum
    # end

  end
end
