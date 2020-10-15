FactoryBot.define do
  factory :transactions do
    token          { "tok_abcdefgfijk00000000000000000" }
    user_id        { 1 }
    item_id        { 1 }
    order_id       { 1 }
    postal_code    { "123-4567" }
    prefecture_id  { 14 }
    city           { "港区" }
    house_number   { "芝公園1丁目1-1" }
    buillding_name { "東京タワー" }
    phone_number   { 11111111111 }
  end
end