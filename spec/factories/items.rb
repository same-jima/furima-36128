FactoryBot.define do
  factory :item do

    title             { Faker::Lorem.sentence }
    name              { "家電" }
    text              { "とてもいい商品です。" }
    category_id       { 2 }
    condition_id      { 2 }
    delivery_id       { 2 }
    area_id           { 2 }
    delivery_day_id   { 2 }
    price             { 100000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
