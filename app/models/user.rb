class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # if user is deleted, all associated posts will be deleted as well
  has_many :posts, dependent: :destroy
end
