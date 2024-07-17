class Payment < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :product, presence: true
  validates :amount, presence: true
end