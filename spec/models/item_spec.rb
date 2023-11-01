require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する' do
    context '出品できる場合' do
      it '項目が全て入力されている' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"  
      end     

      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'detailが空では出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end

      it 'category_id が空では出品できない' do
        @item.category_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'category_id が1では出品できない' do
        @item.category_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'status_idが空では出品できない' do
        @item.status_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it 'status_idが1では出品できない' do
        @item.status_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it 'delivery_cost_idが空では出品できない' do
        @item.delivery_cost_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery cost can't be blank"
      end

      it 'delivery_cost_idが1では出品できない' do
        @item.delivery_cost_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery cost can't be blank"
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
            
      it 'delivery_day_idが空では出品できない' do
        @item.delivery_day_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
           
      it 'delivery_day_idが1では出品できない' do
        @item.delivery_day_id  = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end

      it 'priceが空では出品できない' do
        @item.price  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceは300以上でないと出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      
      it 'priceは9,999,999以下でないと出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      
      it 'priceは半角数値でないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
