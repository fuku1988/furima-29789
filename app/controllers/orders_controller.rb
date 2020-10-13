class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    redirect_to root_path unless user_signed_in?
  end
  
end
