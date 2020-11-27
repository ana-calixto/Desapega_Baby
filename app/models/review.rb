class Review < ApplicationRecord
  belongs_to :user
  validates :raiting, presence: true
  validates :content, presence: true
end
