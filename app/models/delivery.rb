class Delivery < ApplicationRecord
  belongs_to :purchanse

  with_options presence:true do
    validates :zip, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :purefecture_id
    validates :city
    validates :reference
    validates :building
    validates :phone_number, format: { with: /\A\d{11}\z/}
  end
end
