require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '出品者登録' do
    context '新規登録できる時' do
      it '情報を全て正しく入力すれば新規登録できる' do
        expect(@store).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'imageを一枚投稿しない場合出品できない' do
        @store.image = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('イメージ画像を入力してください')
      end
      it 'emailを入力しない場合新規登録できない' do
        @store.email = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'passwordを入力しない場合新規登録できない' do
        @store.password = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'password_confirmationを入力しない場合新規登録できない' do
        @store.password_confirmation = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('確認用パスワードを入力してください')
      end
      it 'last_nameを入力しない場合新規登録できない' do
        @store.last_name = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('姓（漢字）を入力してください')
      end
      it 'first_nameを入力しない場合新規登録できない' do
        @store.first_name = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('名（漢字）を入力してください')
      end
      it 'last_name_kanaを入力しない場合新規登録できない' do
        @store.last_name_kana = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('姓（カナ）を入力してください')
      end
      it 'first_name_kanaを入力しない場合新規登録できない' do
        @store.first_name_kana = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('名（カナ）を入力してください')
      end
      it 'nicknameを入力しない場合新規登録できない' do
        @store.nickname = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('表示名を入力してください')
      end
      it 'last_nameは、全角（漢字）で入力しない場合新規登録できない' do
        @store.last_name = '山だカ'
        @store.valid?
        expect(@store.errors.full_messages).to include('姓（漢字）は漢字で入力してください')
      end
      it 'first_nameは、全角（漢字）で入力しない場合新規登録できない' do
        @store.first_name = '山だカ'
        @store.valid?
        expect(@store.errors.full_messages).to include('名（漢字）は漢字で入力してください')
      end
      it 'last_name_kanaは、全角（カタカナ）で入力しない場合新規登録できない' do
        @store.last_name_kana = '山だカ'
        @store.valid?
        expect(@store.errors.full_messages).to include('姓（カナ）はカタカナで入力してください')
      end
      it 'first_name_kanaは、全角（カタカナ）で入力しない場合新規登録できない' do
        @store.first_name_kana = '山だカ'
        @store.valid?
        expect(@store.errors.full_messages).to include('名（カナ）はカタカナで入力してください')
      end
      it 'emailに一意性がない場合新規登録できない' do
        @store.save
        another_store = FactoryBot.build(:store, email: @store.email)
        another_store.valid?
        expect(another_store.errors.full_messages).to include('メールアドレスは既に登録されています')
      end
      it 'emailに@を含まれていない場合新規登録できない' do
        @store.email = 'aaaaaa'
        @store.valid?
        expect(@store.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが6文字以上ない場合新規登録できない' do
        @store.password = 'aaaaa'
        @store.valid?
        expect(@store.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationは値が一致しない場合新規登録できない' do
        @store.password = 'michi1'
        @store.password_confirmation = 'michi2'
        @store.valid?
        expect(@store.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
      it 'passwordが半角数字のみの場合新規登録できない' do
        @store.password = '1111111'
        @store.valid?
        expect(@store.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
      it 'passwordが半角英語のみの場合新規登録できない' do
        @store.password = 'aaaaaaa'
        @store.valid?
        expect(@store.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
    end
  end
end
