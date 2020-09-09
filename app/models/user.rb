class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name,  format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end

  validates :password, format: {with: /\A[a-z0-9]+\z/}, length: {minimum: 6}
  validates :email, uniqueness: true
end
