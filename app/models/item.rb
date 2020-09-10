class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genle
  belongs_to_active_hash :state
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date

  with_options presence:true do
    validates :name
    validates :acount
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
  end

end
