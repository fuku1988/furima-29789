class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit,:update,:destroy]

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

  def update
    if @item.update(items_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render action: :show
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :description,:category_id,:condition_id,:delivery_cost_id,:delivery_area_id,:delivery_time_id,:sales_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
