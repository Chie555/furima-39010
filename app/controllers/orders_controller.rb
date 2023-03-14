class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :order_item, only: [:index, :create]

  def index
    @order_payment = OrderPayment.new
  end

  def create
    @order_payment= OrderPayment.new(order_params)
    if @order_payment.valid?
      @order_payment.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_payment).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def order_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ""  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
