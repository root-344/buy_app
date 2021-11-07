module SignInSupport
  def sign_in(_farm)
    visit items_path
    fill_in 'farm_email', with: @farm.email
    fill_in 'farm_password', with: @farm.password
    click_on('ログイン')
    expect(current_path).to eq(items_path)
  end
end
