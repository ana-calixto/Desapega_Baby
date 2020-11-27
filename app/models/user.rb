class User < ApplicationRecord
  has_many :products
  has_many :deals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_many :received_reviews, class_name: "Review", foreign_key: "owner_id"
end
