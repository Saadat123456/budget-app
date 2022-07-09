require 'rails_helper'

RSpec.describe BudgettingTransaction, type: :model do
  before :all do
    @user = User.new(name: 'Saadat', email: 'saadatali0202@gmail.com', password: '121212')
    @category = Group.new(user: @user, name: 'Groceries')
  end

  it 'Create a valid transaction' do
    transaction = BudgettingTransaction.new(user: @user, group: @category, name: 'Fruit', amount: 10)
    expect(transaction).to be_valid
  end

  it 'Create an invalid transaction due to wrong name' do
    transaction = BudgettingTransaction.new(user: @user, group: @category, name: '', amount: 10)
    expect(transaction).to be_invalid
    expect(transaction.errors[:name][0]).to be == "Name can't be blank"
  end

  it 'Create an invalid transaction due to wrong amount' do
    transaction = BudgettingTransaction.new(user: @user, group: @category, name: 'Fruits', amount: 0)
    expect(transaction).to be_invalid
    expect(transaction.errors[:amount][0]).to be == 'Amount must be greater than 0'
  end
end
