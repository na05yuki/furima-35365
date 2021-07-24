class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."} do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :family_name_kana
      validates :first_name_kana
    end

    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

end
