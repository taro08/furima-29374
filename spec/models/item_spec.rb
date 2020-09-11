require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての値が存在すれば登録できること' do
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300~¥9,999,999の間であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300~¥9,999,999の間であれば登録できる２' do
        @item.price = 9999999
        expect(@item).to be_valid        
      end
    end
    context '新規登録がうまく行かないとき' do
      it '画像は1枚必須であること' do
      end
      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category は空欄は受け付けません")
      end
      it '商品の状態についての情報が必須であること' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status は空欄は受け付けません")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_time = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time は空欄は受け付けません")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.consignor_area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Consignor area は空欄は受け付けません")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.shipping_costs_burden = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping costs burden は空欄は受け付けません")
      end
      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること2' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it '販売価格は半角数字のみ入力可能であること' do
        @item.price = 'yohi'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
