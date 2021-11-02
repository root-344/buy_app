module SignInSupport
  def sign_in(farm)
    visit root_path
    fill_in  "farm_email", with: @farm.email
    fill_in 'farm_password', with: @farm.password
    click_on('ログイン')
    expect(current_path).to eq(root_path)
  end
  
end