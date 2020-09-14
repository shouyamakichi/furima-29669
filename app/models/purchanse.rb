class Purchanse < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :delivery
  
  attr_accessor :token
  validates :token, presence: true
  
end
