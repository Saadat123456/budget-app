require 'rails_helper'

RSpec.describe Group, type: :model do
  before :all do
    @user = User.new(name: 'Victor', email: 'saadatali0202@gmail.com', password: '121212')
    @category = Group.new(user: @user, name: 'Groceries')
  end

  it 'Create a valid category' do
    category = Group.new(user: @user, name: 'Groceries')
    expect(category).to be_valid
  end

  it 'Create an invalid category due to wrong name' do
    category = Group.new(user: @user, name: '')
    expect(category).to be_invalid
    expect(category.errors[:name][0]).to be == "Name can't be blank"
  end
end