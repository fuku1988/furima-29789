class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  def show
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

end
