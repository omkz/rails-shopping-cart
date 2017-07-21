class OrderItemsController < ApplicationController

  def create
    @order = current_order
    # @order_item = @order.order_items.new(order_item_params)
    # @order.save
    # session[:order_id] = @order.id

    @current_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
    p "current item =", @current_item

    if @current_item
      @current_item.quantity += 1
      @current_item.save
      #udpate subtotal
      @order.update_total

      session[:order_id] = @current_item.order_id
    else
      @order_item = @order.order_items.new(order_item_params)
      @order_item.save
      # @order.save
      @order.update_total
      session[:order_id] = @order.id
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    #udpate subtotal
    @order.update_total
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items

    #udpate subtotal
    @order.update_total

    if @order.order_items.size < 1
      @order.destroy
      session[:order_id] = nil
    end
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
