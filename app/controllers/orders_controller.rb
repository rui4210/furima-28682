class OrdersController < ApplicationController
  before_action :correct_user, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in?
    else
      redirect_to user_session_path
    end
  end

  def create
    @order = OrderPurchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :post_number, :prefecture, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def correct_user
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_url
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
