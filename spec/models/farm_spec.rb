require 'rails_helper'

RSpec.describe Farm, type: :model do
  before do
    @farm = FactoryBot.build(:farm)
  end

  describe '出品者登録' do
    it '情報を全て正しく入力すれば登録できる' do
      expect(@farm).to be_valid
    end
  end
end
