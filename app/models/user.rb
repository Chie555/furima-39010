class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :encrypted_password,length:{ minimum: 6,
    message: "6字以上で入力ください。" } ,format: { with: VALID_PASSWORD_REGEX}
  validates :encrypted_password, format: { with: /\A[a-zA-Z0-9]+\z/,
    message: "半角のアルファベット・数字で入力ください。" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,
    message: "全角の漢字・ひらがな・カタカナで入力ください。"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/,
    message: "全角の漢字・ひらがな・カタカナで入力ください。"}
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,
    message: "全角カタカナで入力ください。"}
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,
    message: "全角カタカナで入力ください。"}
  validates :birthday, presence: true

  has_many :items
  has_many :orders
  has_many :comments
end
