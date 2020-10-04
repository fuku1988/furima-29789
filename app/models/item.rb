class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_time
  
  validates :category
  validates :condition
  validates :delivery_cost
  validates :delivery_area
  validates :delivery_time

  with options numericality: { other_then: 1 }
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :delivery_area_id
    validates :delivery_time_id
  end
   
  belongs_to :user
  # has_one :buy
  has_one_attached :image
  
  with options presence: true
    validetes :name
    validetes :image
    validates :description
  end

end
