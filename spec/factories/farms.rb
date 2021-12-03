FactoryBot.define do
  factory :farm do
    nickname { 'test' }
    email { Faker::Internet.unique.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    gimei = Gimei.name
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    last_name_kana { gimei.last.katakana }
    first_name_kana { gimei.first.katakana }

    after(:build) do |farm|
      farm.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
