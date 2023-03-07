class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :email, uniqueness: true
# 6半角英数字混合
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,format: { with: VALID_PASSWORD_REGEX}
# 全角（漢字・ひらがな・カタカナ）
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
# 全角（カタカナ）
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
# 生年月日
  validates :birthday, presence: true


  has_many :items
  has_many :orders
  has_many :comments

end
