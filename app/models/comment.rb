class Comment < ApplicationRecord
  belongs_to :payment

  validates :body, presence: true

  def formatted_created_at
    created_at.strftime("%B %d, %Y %H:%M")
  end
end
