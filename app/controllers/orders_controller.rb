class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderDelivery.new()
  end

  def create

    @order = OrderDelivery.new(order_params)
    @item = Item.find(params[:item_id])
    binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def order_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number,:order_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )

  end
end
