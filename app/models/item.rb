class Item < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :ship_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :ship_date_id, presence: true
  validates :price, presence: true

  # アソシエーション
  belongs_to :user
  # has_one :order
  # has_many :comments

end
