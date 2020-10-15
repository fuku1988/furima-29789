class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @transactions = Transactions.new
    redirect_to root_path unless authenticate_user!
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new
    @transactions = Transactions.new(transactions_params)
    if @transactions.valid?
      @transactions.save
      pay_item
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def transactions_params
    params.require(:transactions).permit(:postal_code, :prefecture_id, :city ,:house_number ,:buillding_name ,:phone_number ).merge(token: params[:token],user_id: current_user.id,item_id: @item.id, order_id: @order.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.sales_price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end
