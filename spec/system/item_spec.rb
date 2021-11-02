require 'rails_helper'

RSpec.describe "Items", type: :system do
  before do
    @farm = FactoryBot.create(:farm)
  end
  it 'ログインした出品者は商品を出品できる' do
    # ログインする
      # トップページに移動する
      visit root_path
      # ログインページに移動する
      visit new_farm_session_path
      # 出品者情報を入力する
      fill_in 'farm_email', with: @farm.email
      fill_in 'farm_password', with: @farm.password
      # ログインボタンを押してもfarmテーブルにレコード追加されない事を確認する
      expect{
        find('input[value="ログイン"]').click
      }.to change { Farm.count }.by(0)
      # トップページに移動した事を確認する
      expect(current_path).to eq(root_path)
    # 出品画面に移動するボタンが存在する
    expect(page).to have_content('出品')
    # 出品画面に移動する
    visit new_item_path
    # 必要な情報を入力する
    image_path = Rails.root.join('public/images/image.png')
    attach_file('item[image]', image_path, make_visible: true)
    product = "testtest"
    fill_in 'item-name', with: product
    fill_in 'item-info', with: 'testtesttesttest'
    select '根菜類（大根、人参、れんこん、いも類など）', from: 'item[category_id]'
    select '目立った傷はなし', from: 'item[states_id]'
    select '着払い（購入者負担）', from: 'item[shipping_fee_id]'
    select '青森県', from: 'item[region_id]'
    select '1~2日で発送', from: 'item[eta_id]'
    fill_in 'item-price', with: '1999'
    # 出品ボタンを押すとItemテーブルにレコードが1つ増える事を確認する
    expect{
      find('input[value="出品する"]').click
    }.to change { Item.count }.by(1)
    # トップページに遷移する
    expect(current_path).to eq(root_path)
    # トップページに出品した商品の画像が表示される事を確認する
    expect(page).to have_selector('img')
    # トップページに出品した商品の商品名が表示される事を確認する
    expect(page).to have_content(product)
    # トップページに出品した商品の値段が表示される事を確認する
    expect(page).to have_content('1999')
    # トップページに出品した商品の配送料の負担が表示される事を確認する
    expect(page).to have_content('着払い（購入者負担）')
  end

  it 'ログインしてない出品者は商品を出品できない' do
    # トップページに移動する
    visit root_path
    # 出品画面に移動するボタンが存在しない事を確認する
    expect(page).to have_no_selector '.new-item', text: '出品'
  end
end
