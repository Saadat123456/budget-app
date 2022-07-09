class Group < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :budgetting_transactions

  validates :name, presence: { message: 'Name can\'t be blank' }
  validates :user, presence: true
end
