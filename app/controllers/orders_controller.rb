class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    redirect_to root_path unless user_signed_in?
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to item_path
    else
      render root_path
    end
  end

  private
  
  def order_params
    params.permit(:order)
  end

end
