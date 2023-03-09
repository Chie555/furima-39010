class Item < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  # アソシエーション
  belongs_to :user
  has_one_attached :image
  # has_one :order
  # has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :ship_fee
  belongs_to :ship_date

end
