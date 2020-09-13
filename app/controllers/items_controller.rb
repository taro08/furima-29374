class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else 
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category, :price, :status, :delivery_time, :consignor_area, :shipping_costs_burden).merge(user_id: current_user.id)
  end
end
