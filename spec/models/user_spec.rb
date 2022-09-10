require 'rails_helper'

describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Adaobi', email: 'ada@ada.com', password: 'password')
  end

  it 'User should be valid' do
    expect(@user).to be_valid
  end

  it 'User should not be valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
    @user.name = ''
    expect(@user).to_not be_valid
  end

  it 'User should not be valid if name is too long' do
    @user.name = 'g' * 101
    expect(@user).to_not be_valid
  end
end
