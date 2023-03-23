require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'wassim', email: 'wassim@gmail.com', password: '123fbc2') }
  let(:group) { Group.create(name: 'Groceries', icon: 'https://cdn-icons-png.flaticon.com/512/3724/3724720.png', user:) }

  it 'fails because name should be present' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'fails because icon should be present' do
    group.icon = nil
    expect(group).to_not be_valid
  end
end
