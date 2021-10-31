require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入' do
    before do
      item = FactoryBot.create(:item)
      store = FactoryBot.create(:store)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, store_id: store.id)
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されている場合購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_numberを入力しなくても購入できる' do
        @order_address.building_number = nil
        expect(@order_address).to be_valid
      end
      it 'phoneを10桁で入力すれば購入できる' do
        @order_address.phone = 1_111_111_111
        expect(@order_address).to be_valid
      end
      it 'phoneを11桁で入力すれば購入できる' do
        @order_address.phone = 11_111_111_111
        expect(@order_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'zipを入力しない場合購入できない' do
        @order_address.zip = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'zipが半角のハイフンを含んでいない場合購入できない' do
        @order_address.zip = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号にはハイフンを入れてください')
      end
      it 'region_idを選択しない場合購入できない' do
        @order_address.region_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選んで下さい')
      end
      it 'cityを入力しない場合購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'house_numberを入力しない場合購入できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phoneを入力しない場合購入できない' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号（携帯番号）を入力してください')
      end
      it 'phoneを半角数字で入力しない場合購入できない' do
        @order_address.phone = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号（携帯番号）は半角数字10~11桁で入力してください')
      end
      it 'phoneを9桁以下で入力した場合購入できない' do
        @order_address.phone = 111_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号（携帯番号）は半角数字10~11桁で入力してください')
      end
      it 'phoneを12桁以上で入力した場合購入できない' do
        @order_address.phone = 111_111_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号（携帯番号）は半角数字10~11桁で入力してください')
      end
      it 'tokenを入力しない場合購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('カード情報を入力してください')
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Itemを入力してください')
      end
      it 'storeが紐付いていないと保存できないこと' do
        @order_address.store_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Storeを入力してください')
      end
    end
  end
end
