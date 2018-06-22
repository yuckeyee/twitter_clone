require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:user) { create(:user) }

  scenario 'visit user index' do
    login_as user, scope: :user

    create_list(:user, 5)
    visit users_path

    expect(page).to have_selector('.list-group-item-action', count: 6)
  end

  scenario 'search users' do
    login_as user, scope: :user

    create(:user, name: 'Bob')
    create(:user, profile: 'Bob')
    create(:user, name: 'John', profile: 'John')
    visit users_path

    fill_in 'keyword', with: 'Bob'
    click_button 'キーワード検索'
    expect(page).to have_selector('.list-group-item-action', count: 2)
  end

  scenario 'visit user show' do
    login_as user, scope: :user

    create_list(:tweet, 3, user: user)
    visit users_path(user)

    expect(page).to have_selector('.list-group-item', count: 3)
  end
end
