class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy

  with_options presence: true do
    validates :nickname
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字で入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字で入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  end
end
