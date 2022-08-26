require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入機能' do
    context '購入が成功する場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingが未入力でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end

    end

    context '購入が失敗する場合' do
      it 'zipcodeが空では購入できない' do
        @purchase_address.zipcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zipcode can't be blank")
      end

      it 'zipcodeに「-」が含まれていないと購入できない' do
        @purchase_address.zipcode = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zipcode is invalid. Include hyphen(-)")
      end

      it 'zipcodeは「(3桁)-(4桁)」のフォーマットでないと購入できない' do
        @purchase_address.zipcode = '1234-567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zipcode is invalid. Include hyphen(-)")
      end

      it 'prefectureが空では購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureが「---」では購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空で購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空では購入できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上では購入できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'user_idが空では購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
