class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.create(items_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :description,:category_id,:condition_id,:delivery_cost_id,:delivery_erea_id,:delivery_time_id,:sales_price).merge(user_id: current_user.id)
  end

end
