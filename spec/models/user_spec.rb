require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'wassim', email: 'wassim@gmail.com', password: '123fbc2') }

  it 'fails because name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'fails because email should be present' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'fails because it should be a correct email' do
    user.email = 'test'
    expect(user).to_not be_valid
  end

  it 'fails because password should have atleast 6 characters' do
    user.password = '123'
    expect(user).to_not be_valid
  end
end
