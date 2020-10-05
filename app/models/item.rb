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

  with options presence: true do
    validetes :image
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :delivery_area_id
    validates :delivery_time_id
    validetes :name_id
  end

  with options numericality: { other_then: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :delivery_area_id
    validates :delivery_time_id
  end
  
  with_option presence: true ,format: { with: /\A[0-9]+\z/ } do
    validates :seles_price
  end

end
