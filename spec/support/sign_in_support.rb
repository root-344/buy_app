module SignInSupport
  # 出品者
  def sign_in(farm)
      #トップページに移動する
      visit items_path
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
  end
  
  # 購入者
  def sign_in(store)
    #トップページに移動する
    visit items_path
    # ログインページに移動する
    visit new_store_session_path
    # 出品者情報を入力する
    fill_in 'store_email', with: @store.email
    fill_in 'store_password', with: @store.password
    # ログインボタンを押してもstoreテーブルにレコード追加されない事を確認する
    expect  do
      find('input[value="ログイン"]').click
    end.to change { Store.count }.by(0)
    # トップページに移動した事を確認する
    expect(current_path).to eq(items_path)
  end
end
