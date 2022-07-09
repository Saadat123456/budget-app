require 'rails_helper'

RSpec.describe 'Category pages', type: :feature do
  before :all do
    @first_user = User.create(
      name: 'Saadat',
      email: 'saadatali0202@gmail.com',
      password: '121212'
    )
    @category = Group.create(user_id: @first_user.id, name: 'Groceries')
  end

  before :each do
    visit root_path
    click_button 'LOGIN'
    fill_in 'user_email', with: 'saadatali0202@gmail.com'
    fill_in 'user_password', with: '121212'
    click_button 'Log in'
  end

  after :all do
    @category.destroy
    @first_user.destroy
  end

  it 'Expect section Title' do
    expect(page).to have_content('Categories')
  end

  it 'Expect to have category Groceries' do
    path = "//a[@href='/categories/#{@category.id}/budgetting_transactions']"
    expect(page.has_xpath?(path, count: 1) &&
           page.has_content?(@category.name)).to be true
  end

  it 'Navigate to categorie\'s transaction page' do
    page.find("a[href='/categories/#{@category.id}/budgetting_transactions']").click
    expect(current_path).to be == category_budgetting_transactions_path(category_id: @category.id)
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add category page' do
    click_button('Add Category')
    expect(current_path).to be == new_category_path
  end

  it 'Add a new Category' do
    click_button('Add Category')
    fill_in 'category_name', with: 'Movies'
    click_button('Create')
    expect(Group.last.name).to be == 'Movies'
    Group.last.destroy
  end
end
