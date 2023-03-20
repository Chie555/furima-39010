class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :condition_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :ship_fee_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :ship_date_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は半角数値（整数）の300円〜9,999,999円の範囲内で入力してください' }
  validates :image, presence: true
  # アソシエーション
  belongs_to :user
  has_one_attached :image
  has_one :order
  # has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :ship_fee
  belongs_to :ship_date
end
