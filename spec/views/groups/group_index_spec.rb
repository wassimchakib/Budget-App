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

  describe 'index page' do
    it 'shows the title of the page' do
      visit groups_path
      expect(page).to have_content('Categories')
    end

    it 'shows the image of each categorie' do
      visit groups_path
      expect(page).to have_selector('img')
    end

    it 'shows the title of the recipe' do
      visit groups_path
      expect(page).to have_content('Groceries')
    end

    it 'shows the total spent amount' do
      visit groups_path
      expect(page).to have_content('Total spent:')
    end

    it 'clicks on add new categorie' do
      visit groups_path
      click_button 'Add new Categorie'
      expect(page).to have_content('Add Categorie')
    end
  end
end
