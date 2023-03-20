class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :groups

  validates :amount, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                     message: 'Please enter a valid number' }
end
