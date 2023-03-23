require 'rails_helper'

RSpec.describe 'Group', type: :system do
  let :user do
    User.find_or_create_by(email: 'wassimchakib@gmail.com') do |user|
      user.name = 'wassim'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  let(:group) { Group.create(name: 'Groceries', icon: 'https://cdn-icons-png.flaticon.com/512/3724/3724720.png', user:) }

  before(:each) do
    login_as(user)
    group
  end

  describe 'new page' do
    it 'shows the title of the page' do
      visit new_group_operation_path(group.id)
      expect(page).to have_content('Add Operation')
    end

    it 'shows the name input' do
      visit new_group_operation_path(group.id)
      expect(page).to have_selector('input')
    end

    it 'shows the amount input' do
      visit new_group_operation_path(group.id)
      expect(page).to have_selector('input')
    end

    it 'shows the Categories input' do
      visit new_group_operation_path(group.id)
      expect(page).to have_content('Categories')
    end

    it 'fills the input' do
      group
      visit new_group_operation_path(group.id)
      fill_in 'Name', with: 'Apple'
      fill_in 'Amount', with: '20.75'
      select('Groceries', from: 'groups[]')
      expect(page).to have_content('Add Operation')
    end

    it 'goes back to home page' do
      visit new_group_operation_path(group.id)
      find('.fa-arrow-left').click
      expect(page).to have_content('Operations')
    end
  end
end
