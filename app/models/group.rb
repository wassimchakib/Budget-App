class Group < ApplicationRecord
  has_many :group_operations, dependent: :destroy
  has_many :operations, through: :group_operations
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
