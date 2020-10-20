class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_many_attached :images
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_time

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates :sales_price , format: { with: /\A[0-9]+\z/, message: "半角数字を入力してください" }
  end

  with_options numericality: { other_than: 1, message: "は --- 以外を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :delivery_area_id
    validates :delivery_time_id
  end

  validates :sales_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  
end
