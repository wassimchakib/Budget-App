class User < ApplicationRecord
  has_many :groups, :operations

  validates :name, length: { minimum: 3, message: 'Must be at least 3 characters' }
end
