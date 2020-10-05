class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :buy
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_time

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :sales_price , format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }
  end

  with_options numericality: { other_than: 1, message: "can't be blank." } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :delivery_area_id
    validates :delivery_time_id
  end

  validates :sales_price, numericality: { only_integer: true, greater_than_or_equal: 300, less_than_or_equal_to: 9999999,message: "is out of setting range" } 
  
end
