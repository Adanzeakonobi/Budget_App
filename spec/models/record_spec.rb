require 'rails_helper'

describe Record, type: :model do
  before(:each) do
    @user = User.create!(name: 'Adaobi', email: 'ada@ada.com', password: 'password')
    @record = @user.records.create!(name: 'Nintendo Switch', amount: 50)
  end

  it 'Record should be valid' do
    expect(@record).to be_valid
  end

  it 'Record should not be valid without a name' do
    @record.name = nil
    expect(@record).to_not be_valid
    @record.name = ''
    expect(@record).to_not be_valid
  end

  it 'Record should not be valid if name is too long' do
    @record.name = 'g' * 101
    expect(@record).to_not be_valid
  end

  it 'Record should not be valid if amount is negative' do
    @record.amount = -2
    expect(@record).to_not be_valid
  end

  it 'Record should not be valid if amount is not a float' do
    @record.amount = 'fifty'
    expect(@record).to_not be_valid
    @record.amount = false
    expect(@record).to_not be_valid
  end
end
