class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :users, through: :products
end
