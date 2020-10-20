FactoryBot.define do
  factory :item do
    name           { "商品名" }
    description    { Faker::Lorem.sentence }
    sales_price    { 400 }
    category_id       { 2 }
    condition_id      { 2 }
    delivery_cost_id  { 2 }
    delivery_area_id  { 2 }
    delivery_time_id  { 2 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end

    trait :more_images do
      after(:build) do |item| 3.times{
        item.images.attach(io: File.open('public/images/test_image2.png'),filename: 'test_image2.png')
      }
      end
    end

  end
end

# trait :more_images do
#   after(:build) do |item| 3.times{
#     item.images.attach(io: File.open('public/images/test_image2.png'),filename: 'test_image2.png')
#     end
#   }