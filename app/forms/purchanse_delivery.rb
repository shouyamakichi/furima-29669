class PurchanseDelivery

  include ActiveModel::Model
  attr_accessor  :zip, :purefecture_id, :city, :reference, :building, :phone_number, :user_id, :item_id

    # purchanseに関するバリデーション
      attr_accessor :token
      validates :token, presence: true

    # delivaryに関するバリデーション
    with_options presence:true do
      validates :zip, format: { with: /\A\d{3}[-]\d{4}\z/}
      validates :purefecture_id
      validates :city
      validates :reference
      validates :phone_number, format: { with: /\A\d{11}\z/}
    end
    # validates :building

  def save
    # purchanseの情報を保存
    purchanse = Purchanse.create!(user_id: user_id, item_id: item_id)
    # deliveryの情報を保存
    Delivery.create!(zip: zip, purefecture_id: purefecture_id, city: city, reference: reference, building: building, phone_number: phone_number, purchanse_id: purchanse.id)
  end
end