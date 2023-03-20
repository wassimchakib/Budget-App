class Group < ApplicationRecord
  has_many :operations
  belongs_to :user

  validates :name, presence: true
end
