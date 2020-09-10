class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Last name Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'First name Full-width characters'}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name kana Full-width katakana characters'}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name kana Full-width katakana characters'}
    validates :birthday
  end

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX}
  # PASSWORD_REGEX = /\A(?=.?[a-z])(?=.?\d)[a-z\d]+\z/i.freeze
  # validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates :email, uniqueness: { case_sensitive: true }
end
