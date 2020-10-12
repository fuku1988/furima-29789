class OrdersController < ApplicationController

  def index
    @item = Item.new
    redirect_to items_path unless user_signed_in?
  end

end
