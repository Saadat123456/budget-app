class BudgettingTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: { message: "Name can't be blank" }
  validates :user, presence: true
  validates :group, presence: true
  validates :amount, presence: true, numericality:
    { only_float: true, greater_than: 0, message: 'Amount must be greater than 0' }
end
