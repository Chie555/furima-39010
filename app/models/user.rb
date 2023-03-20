class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
# 半角英数字混合
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }
# 全角（漢字・ひらがな・カタカナ）
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
# 全角（カタカナ）
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力してください' }
# 生年月日
  validates :birthday, presence: true
  # アソシエーション
  has_many :items
  has_many :orders
  # has_many :comments
end

