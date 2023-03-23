require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) { User.create(name: 'wassim', email: 'wassim@gmail.com', password: '123fbc2') }
  let(:group) { Group.create(name: 'Groceries', icon: 'https://cdn-icons-png.flaticon.com/512/3724/3724720.png', user:) }
  let(:operation) { Operation.create(name: 'Tomatoes', amount: 5, author: user) }
  it 'fails because name should be present' do
    user.name = nil
    expect(operation).to_not be_valid
  end

  it 'fails because amount should be present' do
    operation.amount = nil
    expect(operation).to_not be_valid
  end

  it 'fails because amount should be positive' do
    operation.amount = -5
    expect(operation).to_not be_valid
  end

  it 'fails because amount should be a number' do
    operation.amount = "test"
    expect(operation).to_not be_valid
  end

  it 'fails because it should have atleast 1 group' do
    expect(operation).to_not be_valid
  end

end
