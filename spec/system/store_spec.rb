require 'rails_helper'

RSpec.describe 'Stores', type: :system do
  before do
    @store = FactoryBot.create(:store)
  end
  it '正しい情報を入力すれば購入者新規登録ができてトップページに移動する' do
    # トップページに移動する
    visit root_path
    # トップページに購入者専用ボタンがある事を確認する
    expect(page).to have_content('購入者様はこちら')
    # 購入者専用ボタをクリックすると新規登録ページに遷移するボタンやログインページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="store-select"]').click
    ).to have_content('新規登録')
    # 新規登録ページに移動する
    visit new_store_registration_path
    # 購入者情報を入力する
    fill_in 'store_first_name', with: @store.first_name
    fill_in 'store_last_name', with: @store.last_name
    fill_in 'store_first_name_kana', with: @store.first_name_kana
    fill_in 'store_last_name_kana', with: @store.last_name_kana
    fill_in 'store_nickname', with: @store.nickname
    fill_in 'store_email', with: 'erito@eeee'
    fill_in 'store_password', with: @store.password
    fill_in 'store_password_confirmation', with: @store.password_confirmation
    # 新規登録ボタンを押すとstoreテーブルにレコードが1つ追加される事を確認する
    expect  do
      find('input[value="登録する"]').click
    end.to change { Store.count }.by(1)
    # トップページに移動した事を確認する
    expect(current_path).to eq(root_path)
    # トップページに購入者の表示名が表示される事を確認する
    expect(page).to have_content("#{@store.nickname}さん")
    # トップページにログアウトボタンが表示される事を確認する
    expect(page).to have_content('ログアウト')
    # トップページに退会ボタンが表示される事を確認する
    expect(page).to have_content('退会')
    # トップページに商品一覧ボタンが表示される事を確認する
    expect(page).to have_content('商品一覧')
    # トップページに出品者専用ボタンがない事を確認する
    expect(page).to have_no_content('出品者様はこちら')
    # トップページに購入者専用ボタンがない事を確認する
    expect(page).to have_no_content('購入者様はこちら')
  end

  it '誤った情報では新規登録できず購入者新規登録ページに戻ってくる' do
    # トップページに移動する
    visit root_path
    # トップページに購入者専用ボタンがある事を確認する
    expect(page).to have_content('購入者様はこちら')
    # 購入者専用ボタをクリックすると新規登録ページに遷移するボタンやログインページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="farm-select"]').click
    ).to have_content('新規登録')
    # 新規登録ページに移動する
    visit new_store_registration_path
    # 出品者情報を入力する
    fill_in 'store_first_name', with: ''
    fill_in 'store_last_name', with: ''
    fill_in 'store_first_name_kana', with: ''
    fill_in 'store_last_name_kana', with: ''
    fill_in 'store_nickname', with: ''
    fill_in 'store_email', with: ''
    fill_in 'store_password', with: ''
    fill_in 'store_password_confirmation', with: ''
    # 新規登録ボタンを押してもstoreテーブルに追加されない事を確認する
    expect  do
      find('input[value="登録する"]').click
    end.to change { Store.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq store_registration_path
    # トップページに出品者専用ボタンが表示される事を確認する
    expect(page).to have_content('出品者様はこちら')
    # トップページに購入者専用ボタンが表示される事を確認する
    expect(page).to have_content('購入者様はこちら')
  end

  it '正しい情報を入力すれば購入者ログインができてトップページに移動する' do
    # トップページに移動する
    visit root_path
    # トップページに購入者専用ボタンがある事を確認する
    expect(page).to have_content('購入者様はこちら')
    # 購入者専用ボタをクリックするとログインページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="store-select"]').click
    ).to have_content('ログイン')
    # ログインページに移動する
    visit new_store_session_path
    # 購入者情報を入力する
    fill_in 'store_email', with: @store.email
    fill_in 'store_password', with: @store.password
    # ログインボタンを押してもfarmテーブルにレコード追加されない事を確認する
    expect  do
      find('input[value="ログイン"]').click
    end.to change { Store.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq(root_path)
    # トップページに購入者の表示名が表示される事を確認する
    expect(page).to have_content("#{@store.nickname}さん")
    # トップページにログアウトボタンが表示される事を確認する
    expect(page).to have_content('ログアウト')
    # トップページに退会ボタンが表示される事を確認する
    expect(page).to have_content('退会')
    # トップページに商品一覧ボタンが表示される事を確認する
    expect(page).to have_content('商品一覧')
    # トップページに出品者専用ボタンがない事を確認する
    expect(page).to have_no_content('出品者様はこちら')
    # トップページに購入者専用ボタンがない事を確認する
    expect(page).to have_no_content('購入者様はこちら')
  end

  it '誤った情報ではログインできず購入者ログインページに戻ってくる' do
    # トップページに移動する
    visit root_path
    # トップページに出品者専用ボタンがある事を確認する
    expect(page).to have_content('購入者様はこちら')
    # 出品者専用ボタをクリックするとログインページに遷移するボタンが表示される事を確認する
    expect(
      find('div[id="store-select"]').click
    ).to have_content('ログイン')
    # 新規登録ページに移動する
    visit new_store_session_path
    # 購入者情報を入力する
    fill_in 'store_email', with: ''
    fill_in 'store_password', with: ''
    # ログインボタンを押してもstoreテーブルにレコードは追加されない事を確認する
    expect  do
      find('input[value="ログイン"]').click
    end.to change { Store.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq store_session_path
    # トップページに出品者専用ボタンが表示される事を確認する
    expect(page).to have_content('出品者様はこちら')
    # トップページに購入者専用ボタンが表示される事を確認する
    expect(page).to have_content('購入者様はこちら')
  end
end
