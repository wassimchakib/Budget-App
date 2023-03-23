require 'rails_helper'

RSpec.describe 'Operation', type: :system do
  let :user do
    User.find_or_create_by(email: 'wassimchakib@gmail.com') do |user|
      user.name = 'wassim'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  let(:group) { Group.create(name: 'Groceries', icon: 'https://cdn-icons-png.flaticon.com/512/3724/3724720.png', user:) }
  let(:operation) { Operation.create(name: 'Tomatoes', amount: 5, author: user) }

  before(:each) do
    login_as(user)
  end

  describe 'index page' do
    it 'shows the title of the page' do
      visit group_operations_path(group.id)
      expect(page).to have_content('Operations')
    end

    it 'shows the total Amount' do
      visit group_operations_path(group.id)
      expect(page).to have_content('Total Amount:')
    end

    it 'shows the date of operation' do
      visit group_operations_path(group.id)
      expect(page).to have_content('Date')
    end

    it 'shows the name of operation' do
      visit group_operations_path(group.id)
      expect(page).to have_content('Name')
    end

    it 'shows the cost of each operation' do
      visit group_operations_path(group.id)
      expect(page).to have_content('Cost')
    end
  end
end
