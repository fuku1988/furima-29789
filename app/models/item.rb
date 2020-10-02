class Item < ApplicationRecord

  belongs_to :user
  # has_one :buy
  # has_one_attached :image

  with options presence: true
    validetes :name
    validetes :image
    validates :description
  end
end
