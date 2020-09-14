class ItemsController < ApplicationController
  before_action :not_login_user, only: [:new, :create]
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :price, :status_id, :delivery_time_id, :consignor_area_id, :shipping_costs_burden_id).merge(user_id: current_user.id)
  end

  def not_login_user
    redirect_to items_path unless user_signed_in?
  end
end
