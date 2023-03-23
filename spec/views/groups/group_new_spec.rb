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
      visit new_group_path
      expect(page).to have_content('Add Categorie')
    end

    it 'shows the name input' do
      visit new_group_path
      expect(page).to have_content('Name')
    end

    it 'shows the icon input' do
      visit new_group_path
      expect(page).to have_content('Icon')
    end

    it 'fills the input' do
      visit new_group_path
      fill_in 'Name', with: 'Foods'
      fill_in 'Icon', with: 'https://cdn-icons-png.flaticon.com/512/3724/3724720.png'
      click_button 'Add new category'
      expect(page).to have_content('Foods')
    end

    it 'goes back to home page' do
      visit new_group_path
      find('.fa-arrow-left').click
      expect(page).to have_content('Categories')
    end
  end
end
