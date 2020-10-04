class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
    validates :category

  belongs_to_active_hash :condition
    validates :condition

  with options numericality: { other_then: 1 }
    validates :category_id
    validates :condition_id
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
