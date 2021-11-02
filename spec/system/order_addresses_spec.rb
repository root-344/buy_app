require 'rails_helper'

RSpec.describe 'OrderAddresses', type: :system do
  before do
    @item = FactoryBot.create(:item)
    @store = FactoryBot.create(:store)
  end

  # it  '購入者がログインしていれば売り切れていない商品を購入できる' do
  #   # トップページに移動する
  #   visit root_path
  #   # 購入者がログインする
  #     # トップページに移動する
  #     visit root_path
  #     # ログインページに移動する
  #     visit new_store_session_path
  #     # 出品者情報を入力する
  #     fill_in 'store_email', with: @store.email
  #     fill_in 'store_password', with: @store.password
  #     # ログインボタンを押してもfarmテーブルにレコード追加されない事を確認する
  #     expect{
  #       find('input[value="ログイン"]').click
  #     }.to change { Farm.count }.by(0)
  #     # トップページに移動した事を確認する
  #     expect(current_path).to eq(root_path)
  #   # トップページに商品が存在する事を確認する
  #   expect(page).to have_selector('img')
  #   # 商品詳細ページに移動する
  #   visit item_path(@item)
  #   # 詳細ページに購入ページに遷移できるボタンがある事を確認する
  #   expect(page).to have_content('購入する')
  #   # 購入ページに移動する
  #   visit item_orders_path(@item)
  #   # 情報を入力する
  #   # fill_in 'card-number', with: '4242424242424242'
  #   # fill_in 'card-exp-month', with: '4'
  #   # fill_in 'card-exp-year', with: '33'
  #   # fill_in 'card-cvc', with: '123'
  #   @order = FactoryBot(:order)
  #   fill_in ''
  #   fill_in 'postal-code', with: '111-1111'
  #   select '東京都', from: 'order_address[region_id]'
  #   fill_in 'city', with: '横浜市緑区'
  #   fill_in 'house', with: '高尾'
  #   fill_in 'building', with: '柳ビル'
  #   fill_in 'phone-number', with: '11111111111'
  #   # 購入ボタンをクリックするとorderテーブルにレコードが1つ増える事を確認する
  #   expect{
  #     find('input[name="buy-btn"]').click
  #   }.to change { Order.count }.by(1)
  #   # トップページに遷移する
  #   expect(current_path).to eq(root_path)
  #   # トップページの商品画像に売り切れている事を確認する
  #   expect(page).to have_content('売却済み')
  # end

  it '購入者がログインしていない場合商品を購入できない' do
    # トップページに移動する
    visit root_path
    # トップページに商品が存在する事を確認する
    expect(page).to have_selector('img')
    # 商品詳細ページに移動する
    visit item_path(@item)
    # 詳細ページに購入ページに遷移できるボタンが表示されない事を確認する
    expect(page).to have_no_selector '.item-order-btn', text: '購入する'
  end

  it '正しい情報を入力しない場合商品を購入できずに購入ページに戻される' do
    # 購入者がログインする
    # トップページに移動する
    visit root_path
    # ログインページに移動する
    visit new_store_session_path
    # 出品者情報を入力する
    fill_in 'store_email', with: @store.email
    fill_in 'store_password', with: @store.password
    # ログインボタンを押してもfarmテーブルにレコード追加されない事を確認する
    expect  do
      find('input[value="ログイン"]').click
    end.to change { Farm.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq(root_path)
    # トップページに商品が存在する事を確認する
    expect(page).to have_selector('img')
    # 商品詳細ページに移動する
    visit item_path(@item)
    # 詳細ページに購入ページに遷移できるボタンがある事を確認する
    expect(page).to have_selector '.item-order-btn', text: '購入する'
    # 購入ページに移動する
    visit item_orders_path(@item)
    # 情報を入力する
    fill_in 'card-number', with: ''
    fill_in 'card-exp-month', with: ''
    fill_in 'card-exp-year', with: ''
    fill_in 'card-cvc', with: ''
    fill_in 'postal-code', with: ''
    select '--', from: 'order_address[region_id]'
    fill_in 'city', with: ''
    fill_in 'house', with: ''
    fill_in 'building', with: ''
    fill_in 'phone-number', with: ''
    # 購入ボタンをクリックしてもorderテーブルにレコードが増えない事を確認する
    expect  do
      find('input[name="buy-btn"]').click
    end.to change { Order.count }.by(0)
    # 商品購入ページに移動する
    expect(current_path).to eq(item_orders_path(@item))
  end
end
