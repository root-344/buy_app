class Farm < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy

  # with_options presence: true do
  #   validates :nickname
  #   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  #   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #   validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字で入力してください' }
  #   validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字で入力してください' }
  #   validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字で入力してください' }
  #   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字で入力してください' }
  #   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  #   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  #   validates :email,format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false ,message: "はすでに使用されています"}
  # end
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :nickname
    validates :email
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'は半角英数字で入力してください' }
    validates :password_confirmation, format: { with: /\A[a-z0-9]+\z/i, message: 'は半角英数字で入力してください' }
    with_options length: { maximum: 10, message: 'は10文字以下で入力してください' } do
      validates :first_name
      validates :last_name
      validates :first_name_kana
      validates :last_name_kana
      with_options format: { with: /\A[一-龥]+\z/, message: 'は漢字で入力してください' } do
        validates :first_name
        validates :last_name
      end
      with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' } do
        validates :first_name_kana
        validates :last_name_kana
      end
    end
    with_options uniqueness: { case_sensitive: true, message: 'は既に登録されています' } do
      validates :nickname, length: { maximum: 20, message: 'は20文字以内で登録してください' }
      validates :email
    end
  end
end
