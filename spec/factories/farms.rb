FactoryBot.define do
  factory :farm do
    nickname { 'test' }
    email { Faker::Internet.unique.free_email }
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    gimei = Gimei.name
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    last_name_kana { gimei.last.katakana }
    first_name_kana { gimei.first.katakana }
  end
end
