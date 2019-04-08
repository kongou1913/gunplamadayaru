class Comment < ApplicationRecord
  validates :lines, presence: true, length: {maximum: 1000 }

  belongs_to :user
  belongs_to :topic
end
