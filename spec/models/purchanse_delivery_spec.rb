require 'rails_helper'

RSpec.describe PurchanseDelivery, type: :model do
  describe '商品購入機能の実装' do
    before do
      @seller = FactoryBot.create(:user)
      @buyer =  FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @seller.id)
      @purchanse_delivery = FactoryBot.build(:purchanse_delivery, user_id: @buyer.id, item_id: @item.id)
    end
    
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchanse_delivery).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @purchanse_delivery.token = ""
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Token can't be blank")
    end

    it 'zipが空だと保存できないこと' do
      @purchanse_delivery.zip = ""
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Zip can't be blank")
    end

    it 'zipがハイフンなしだと登録できないこと' do
      @purchanse_delivery.zip = "1234567"
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Zip is invalid")
    end

    it 'purefecture_idが空だと保存できない' do
      @purchanse_delivery.purefecture_id = ""
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Purefecture can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @purchanse_delivery.city = ""
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("City can't be blank")
    end

    it 'referenceが空だと保存できないこと' do
      @purchanse_delivery.reference = ""
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Reference can't be blank")
    end

    it 'phone_numberが空だと登録できない' do
      @purchanse_delivery.phone_number = ""
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberがハイフンありだと登録できない' do
      @purchanse_delivery.phone_number = "090-1234-4566"
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが11桁以内でないと登録できない' do
      @purchanse_delivery.phone_number = "0901234224566"
      @purchanse_delivery.valid?
      expect(@purchanse_delivery.errors.full_messages).to include("Phone number is invalid")
    end

  end
end
