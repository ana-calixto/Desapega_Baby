class Review < ApplicationRecord
  validates :raiting, presence: true
  validates :content, presence: true
  belongs_to :user
  validates :content, length: { minimum: 5 }
  belongs_to :owner, class_name: "User"
end
