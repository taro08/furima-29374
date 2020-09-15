class ItemsController < ApplicationController
  before_action :not_login_user, only: [:new, :create]
  before_action :set_item, only: [ :edit, :update, :show]

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
  end

  def edit
  end

  def update
    
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :price, :status_id, :delivery_time_id, :consignor_area_id, :shipping_costs_burden_id).merge(user_id: current_user.id)
  end

  def not_login_user
    redirect_to items_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
