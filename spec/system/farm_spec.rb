require 'rails_helper'

RSpec.describe 'Farms', type: :system do
  before do
    @farm = FactoryBot.create(:farm)
  end
  it '正しい情報を入力すれば出品者新規登録ができてトップページに移動する' do
    # トップページに移動する
    visit items_path
    # トップページに出品者専用ボタンがある事を確認する
    expect(page).to have_content('出品者様はこちら')
    # 出品者専用ボタをクリックすると新規登録ページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="farm-select"]').click
    ).to have_content('新規登録')
    # 新規登録ページに移動する
    visit new_farm_registration_path
    # 出品者情報を入力する
    image_path = Rails.root.join('public/images/image.png')
    attach_file('farm[image]', image_path, make_visible: true)
    fill_in 'farm_first_name', with: @farm.first_name
    fill_in 'farm_last_name', with: @farm.last_name
    fill_in 'farm_first_name_kana', with: @farm.first_name_kana
    fill_in 'farm_last_name_kana', with: @farm.last_name_kana
    fill_in 'farm_nickname', with: @farm.nickname
    fill_in 'farm_email', with: 'erito@eeee'
    fill_in 'farm_password', with: @farm.password
    fill_in 'farm_password_confirmation', with: @farm.password_confirmation
    # 新規登録ボタンを押すとfarmテーブルにレコードが1つ追加される事を確認する
    expect  do
      find('input[value="登録する"]').click
    end.to change { Farm.count }.by(1)
    # トップページに移動した事を確認する
    expect(current_path).to eq(items_path)
    # トップページに出品者の表示名が表示される事を確認する
    expect(page).to have_content("#{@farm.nickname}さん")
    # トップページにログアウトボタンが表示される事を確認する
    expect(page).to have_content('ログアウト')
    # トップページに商品一覧ボタンが表示される事を確認する
    expect(page).to have_content('商品一覧')
    # トップページに出品ボタンが表示される事を確認する
    expect(page).to have_content('出品')
    # トップページに出品者専用ボタンがない事を確認する
    expect(page).to have_no_content('出品者様はこちら')
    # トップページに購入者専用ボタンがない事を確認する
    expect(page).to have_no_content('購入者様はこちら')
  end
  it '誤った情報では新規登録できず出品者新規登録ページに戻ってくる' do
    # トップページに移動する
    visit items_path
    # トップページに出品者専用ボタンがある事を確認する
    expect(page).to have_content('出品者様はこちら')
    # 出品者専用ボタをクリックすると新規登録ページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="farm-select"]').click
    ).to have_content('新規登録')
    # 新規登録ページに移動する
    visit new_farm_registration_path
    # 出品者情報を入力する
    fill_in 'farm_first_name', with: ''
    fill_in 'farm_last_name', with: ''
    fill_in 'farm_first_name_kana', with: ''
    fill_in 'farm_last_name_kana', with: ''
    fill_in 'farm_nickname', with: ''
    fill_in 'farm_email', with: ''
    fill_in 'farm_password', with: ''
    fill_in 'farm_password_confirmation', with: ''
    # 新規登録ボタンを押してもfarmテーブルにレコードは追加されない事を確認する
    expect  do
      find('input[value="登録する"]').click
    end.to change { Farm.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq farm_registration_path
    # トップページに出品者専用ボタンが表示される事を確認する
    expect(page).to have_content('出品者様はこちら')
    # トップページに購入者専用ボタンが表示される事を確認する
    expect(page).to have_content('購入者様はこちら')
  end
  it '正しい情報を入力すれば出品者ログインができてトップページに移動する' do
    # トップページに移動する
    visit items_path
    # トップページに出品者専用ボタンがある事を確認する
    expect(page).to have_content('出品者様はこちら')
    # 出品者専用ボタをクリックするとログインページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="farm-select"]').click
    ).to have_content('ログイン')
    # ログインページに移動する
    visit new_farm_session_path
    # 出品者情報を入力する
    fill_in 'farm_email', with: @farm.email
    fill_in 'farm_password', with: @farm.password
    # ログインボタンを押してもfarmテーブルにレコード追加されない事を確認する
    expect  do
      find('input[value="ログイン"]').click
    end.to change { Farm.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq(items_path)
    # トップページに出品者の表示名が表示される事を確認する
    expect(page).to have_content("#{@farm.nickname}さん")
    # トップページにログアウトボタンが表示される事を確認する
    expect(page).to have_content('ログアウト')
    # トップページに商品一覧ボタンが表示される事を確認する
    expect(page).to have_content('商品一覧')
    # トップページに出品ボタンが表示される事を確認する
    expect(page).to have_content('出品')
    # トップページに出品者専用ボタンがない事を確認する
    expect(page).to have_no_content('出品者様はこちら')
    # トップページに購入者専用ボタンがない事を確認する
    expect(page).to have_no_content('購入者様はこちら')
  end
  it '誤った情報ではログインできず出品者ログインページに戻ってくる' do
    # トップページに移動する
    visit items_path
    # トップページに出品者専用ボタンがある事を確認する
    expect(page).to have_content('出品者様はこちら')
    # 出品者専用ボタをクリックするとログインページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="farm-select"]').click
    ).to have_content('ログイン')
    # 新規登録ページに移動する
    visit new_farm_session_path
    # 出品者情報を入力する
    fill_in 'farm_email', with: ''
    fill_in 'farm_password', with: ''
    # ログインボタンを押してもfarmテーブルにレコードは追加されない事を確認する
    expect  do
      find('input[value="ログイン"]').click
    end.to change { Farm.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq farm_session_path
    # トップページに出品者専用ボタンが表示される事を確認する
    expect(page).to have_content('出品者様はこちら')
    # トップページに購入者専用ボタンが表示される事を確認する
    expect(page).to have_content('購入者様はこちら')
  end
end
