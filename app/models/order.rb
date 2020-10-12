class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  with_options presence: true do
    validates :address
  end

end
