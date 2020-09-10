class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: ' Name Full-width characters' } do
    validates :last_name
    validates :first_name
end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: ' Name kana Full-width katakana characters'} do
    validates :last_name_kana
    validates :first_name_kana
  end

    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    validates :email, uniqueness: { case_sensitive: true }
end
