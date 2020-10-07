class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(items_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :description,:category_id,:condition_id,:delivery_cost_id,:delivery_area_id,:delivery_time_id,:sales_price).merge(user_id: current_user.id)
  end

end
