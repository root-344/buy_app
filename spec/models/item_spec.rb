require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '情報が全て正しく入力されている場合商品を出品できる' do
        @item.valid?
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'productを入力してない場合出品できない' do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品名を入力してください"}
      end
      it 'category_idを入力してない場合出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品のジャンルを選択してください"}
      end
      it 'states_idを入力してない場合出品できない' do
        @item.states_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の状態を選択してください"}
      end
      it 'shipping_fee_idを入力してない場合出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の配送料を選択してください"}
      end
      it 'region_idを入力してない場合出品できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の発送地域を選択してください"}
      end
      it 'eta_idを入力してない場合出品できない' do
        @item.eta_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の発送日数を選択してください"}
      end
      it 'category_idが1の場合出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品のジャンルを選択してください"}
      end
      it 'states_idが1の場合出品できない' do
        @item.states_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の状態を選択してください"}
      end
      it 'shipping_fee_idが1の場合出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の配送料を選択してください"}
      end
      it 'region_idが1の場合出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の発送地域を選択してください"}
      end
      it 'eta_idが1の場合出品できない' do
        @item.eta_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include{"商品の発送日数を選択してください"}
      end
      it 'priceを入力してない場合出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"値段を入力してください"}
      end
      it 'priceが9以下の場合出品できない' do
        @item.price = 9
        @item.valid?
        expect(@item.errors.full_messages).to include{"値段は9~9,999,999の半角数字で入力してください"}
      end
      it 'priceが10,000,000より大きい場合出品できない' do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include{"値段は9~9,999,999の半角数字で入力してください"}
      end
      it 'priceが半角数字でない場合出品できない' do
        @item.price = '１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include{"値段は9~9,999,999の半角数字で入力してください"}
      end
      it 'imageを一枚投稿しない場合出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include{"出品画像を入力してください"}
      end
    end
  end
end
