class Address < ApplicationRecord
  extend ActiveHush::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order

  with_options presence: true do
    validates :postel_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end

end
