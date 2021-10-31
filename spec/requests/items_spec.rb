require 'rails_helper'

RSpec.describe 'Items', type: :request do
  before do
    @item = FactoryBot.create(:item)
    get root_path
  end
  describe 'GET /index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに商品検索フォームが表示されている' do
      expect(response.body).to include('出品物を検索する')
    end
    it 'indexアクションにリクエストするとレスポンスに出品済みの商品の画像URLが表示されている' do
      expect(response.body).to include(url_for(@item.image))
    end
    it 'indexアクションにリクエストするとレスポンスに出品済みの商品名が表示されている' do
      expect(response.body).to include(@item.product)
    end
    it 'indexアクションにリクエストするとレスポンスに出品済みの商品の値段が表示されている' do
      expect(response.body).to include(@item.price.to_s)
    end
    it 'indexアクションにリクエストするとレスポンスに出品済みの商品の配送料が表示されている' do
      expect(response.body).to include(@item.shipping_fee.name.to_s)
    end
  end
  describe 'Get #show' do
    context '出品者がログインした時' do
      before do
        @farm = FactoryBot.create(:farm)
        @item = FactoryBot.create(:item, farm: @farm)
        sign_in @farm
        get item_path(@item)
      end
      it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
        expect(response.status).to eq 200
      end
      it 'indexアクションにリクエストするとレスポンスに商品検索フォームが存在する' do
        expect(response.body).to include('出品物を検索する')
      end
      it 'indexアクションにリクエストするとレスポンスに出品済みの商品の画像URLが存在する' do
        expect(response.body).to include(url_for(@item.image))
      end
      it 'indexアクションにリクエストするとレスポンスに出品済みの商品名が存在する' do
        expect(response.body).to include(@item.product)
      end
      it 'indexアクションにリクエストするとレスポンスに出品済みの商品の値段が存在する' do
        expect(response.body).to include(@item.price.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の編集ボタンが存在する' do
        expect(response.body).to include('編集')
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の削除ボタンが存在する' do
        expect(response.body).to include('削除')
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の説明が存在する' do
        expect(response.body).to include(@item.description)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品のカテゴリーが存在する' do
        expect(response.body).to include(@item.category.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の状態が存在する' do
        expect(response.body).to include(@item.states.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の配送料の負担が存在する' do
        expect(response.body).to include(@item.shipping_fee.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の発送元の地域が存在する' do
        expect(response.body).to include(@item.region.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の発送日の目安が存在する' do
        expect(response.body).to include(@item.eta.name.to_s)
      end
    end
    context '購入者がログインした時' do
      before do
        @item = FactoryBot.create(:item)
        @store = FactoryBot.create(:store)
        sign_in @store
        get item_path(@item)
      end
      it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
        expect(response.status).to eq 200
      end
      it 'indexアクションにリクエストするとレスポンスに商品検索フォームが存在する' do
        expect(response.body).to include('出品物を検索する')
      end
      it 'indexアクションにリクエストするとレスポンスに出品済みの商品の画像URLが存在する' do
        expect(response.body).to include(url_for(@item.image))
      end
      it 'indexアクションにリクエストするとレスポンスに出品済みの商品名が存在する' do
        expect(response.body).to include(@item.product)
      end
      it 'indexアクションにリクエストするとレスポンスに出品済みの商品の値段が存在する' do
        expect(response.body).to include(@item.price.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の購入ボタンが存在する' do
        expect(response.body).to include('購入する')
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の説明が存在する' do
        expect(response.body).to include(@item.description)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品のカテゴリーが存在する' do
        expect(response.body).to include(@item.category.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の状態が存在する' do
        expect(response.body).to include(@item.states.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の配送料の負担が存在する' do
        expect(response.body).to include(@item.shipping_fee.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の発送元の地域が存在する' do
        expect(response.body).to include(@item.region.name.to_s)
      end
      it 'showアクションにリクエストするとレスポンスに出品済みの商品の発送日の目安が存在する' do
        expect(response.body).to include(@item.eta.name.to_s)
      end
    end
  end
end
