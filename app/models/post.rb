class Post < ApplicationRecord
  belongs_to :user
  validates :title, :body, length: { minimum: 1, maximum: 100 }
end
