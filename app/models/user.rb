class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buys

  with_options presence: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    VALID_PASSWORD_REGEX = /[a-z\d]{6,}/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :nickname
    validates :first_name
    validates :last_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
  end

end
