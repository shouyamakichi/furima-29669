require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item , user_id: user.id)
    end

    describe '商品登録' do
      context '商品登録がうまくいく時' do
        it 'image,name,acount,state_id,postage_id,region_id,shipping_date_id,price,category_idが存在すれば登録できる' do
          binding.pry
          expect(@item).to be_valid
        end
      end
    end

    context '商品登録がうまくいかない時' do
      it 'imageが空だと登録できない' do    
      end

      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'acountが空だと登録できない' do
        @item.acount = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Acount can't be blank")
      end

      it 'state_idが空だと登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State is not a number")
      end

      it 'postage_idが空だと登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage is not a number")
      end

      it 'region_idが空だと登録できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region is not a number")
      end

      it 'shipping_date_idが空だと登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is not a number")
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it 'priceが空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end

      it 'priceが全角数字だと登録できない' do
        @item.price = '１１１１１１'
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが全角だと登録できない' do
        @item.price = 'ああああああ'
        @item.price = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角英字だと登録できない' do
        @item.price = 'aaaaaaaa'
        @item.price = 'aaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      
      it 'priceが299円以下なら登録できない' do
        @item.price = '298'
        @item.price = '298'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end

      it 'priceが10,000,000以上なら登録できない' do
        @item.price = '10000000'
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
