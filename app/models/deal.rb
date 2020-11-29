
class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :owner, through: :product
end
