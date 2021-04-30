class Todo < ApplicationRecord

  validates :body, presence: true
end
