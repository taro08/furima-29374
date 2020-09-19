require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の実装' do
    before do
      @order_delivery = FactoryBot.build(:order_delivery)
    end
    context '登録がうまくいくとき' do
      it 'すべての値が正しく入力されていたら保存できること' do
        expect(@order_delivery).to be_valid
      end
    end

    context '登録がうまく行かないとき' do
      it '郵便番号が必須であること' do
        @order_delivery.postal_code = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれていること' do
        @order_delivery.postal_code = "000000"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '県名が選択されていること' do
        @order_delivery.prefecture_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が記載されていること' do
        @order_delivery.city = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が記載されていること' do
        @order_delivery.house_number = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が記載されていること' do
        @order_delivery.phone_number = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以内であること' do
        @order_delivery.phone_number = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
