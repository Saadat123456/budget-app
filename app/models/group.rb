class Group < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :budgetting_transactions
end
