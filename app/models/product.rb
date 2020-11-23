class Product < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  validates :price, presence: true  
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :deals
end
