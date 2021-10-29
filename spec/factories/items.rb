FactoryBot.define do
  factory :item do
    product          { 'test' }
    description      { 'testtest' }
    category_id      { 2 }
    states_id        { 2 }
    shipping_fee_id  { 2 }
    region_id        { 2 }
    eta_id           { 2 }
    price            { 2000 }
    association :farm

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
