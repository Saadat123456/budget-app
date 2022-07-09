require 'rails_helper'

RSpec.describe 'Transactions pages', type: :feature do
  before :all do
    @first_user = User.create(
      name: 'Saadat',
      email: 'saadatali0202@gmail.com',
      password: '121212'
    )
    @category = Group.create(user: @first_user, name: 'Groceries')
    @transaction = BudgettingTransaction.create(user: @first_user, group: @category, name: 'Cereal', amount: 10)
  end

  before :each do
    visit root_path
    click_button 'LOGIN'
    fill_in 'user_email', with: 'saadatali0202@gmail.com'
    fill_in 'user_password', with: '121212'
    click_button 'Log in'
    click_link(@category.name)
  end

  after :all do
    @transaction.destroy
    @category.destroy
    @first_user.destroy
  end

  it 'Expect section Title' do
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add transaction page' do
    click_button('Add Transaction')
    expect(current_path).to be == new_category_budgetting_transaction_path(category_id: @category.id)
  end

  it 'Add a new Transaction' do
    click_button('Add Transaction')
    fill_in 'budgetting_transactions_name', with: 'Apples'
    fill_in 'budgetting_transactions_amount', with: '15'
    click_button('Create')
    expect(BudgettingTransaction.last.name).to be == 'Apples'
    BudgettingTransaction.last.destroy
  end

  it 'Navigate to transactions\'s detail page' do
    click_link(@transaction.name)
    expect(current_path).to be == category_budgetting_transaction_path(id: @transaction.id, category_id: @category.id)
    expect(page).to have_content('Details')
  end
end
