class OrderPayment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は半角数字3桁-(ハイフン)半角数字4桁の形で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10〜11桁で入力してください' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Payment.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
