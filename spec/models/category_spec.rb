require 'rails_helper'

describe Category, type: :model do
  before(:each) do
    @user = User.create!(name: 'Adaobi', email: 'ada@ada.com', password: 'password')
    @category = @user.categories.new(name: 'Games')
  end

  it 'should not be valid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
    @category.name = ''
    expect(@category).to_not be_valid
  end

  it 'should not be valid if name is too long' do
    @category.name = 'g' * 291
    expect(@category).to_not be_valid
  end
end
