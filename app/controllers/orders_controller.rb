class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]


  def index
    @order = Order.new
    @transactions = Transactions.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if user_signed_in? && current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path 
    end
  end

end
