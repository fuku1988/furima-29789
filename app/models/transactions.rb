class Transactions
  include ActiveModel::Model
  attr_accessor :token,:item_id,:user_id,:order_id,:postal_code,:prefecture_id,:city,:house_number,:buillding_name,:phone_number
  
  with_options presence: true do
    validates :token
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end


  with_options numericality: { other_than: 1, message: "は --- 以外を選択してください" } do
    validates :prefecture_id
  end

  validates :postal_code,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は半角数字で入力してください（ハイフンが必要です）"}
  validates :phone_number,format: {with:  /\A[0-9]{9,11}\z/ ,message: "は半角数字で入力してください（ハイフンは不要です）"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,buillding_name: buillding_name, phone_number: phone_number)
  end

end