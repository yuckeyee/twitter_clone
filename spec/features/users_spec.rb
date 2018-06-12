require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "visit user index" do
    user = create(:user)
    login_as user, scope: :user

    create_list(:user, 5)
    visit users_path

    expect(page).to have_selector('.list-group-item', count: 8)
  end

  scenario "search users" do
    user = create(:user)
    login_as user, scope: :user

    create(:user, name: 'Bob')
    create(:user, profile: 'Bob')
    create(:user, name: 'John', profile: 'John')
    visit users_path

    fill_in "search", with: 'Bob'
    click_button "キーワード検索"
    expect(page).to have_selector('.list-group-item', count: 4)
  end
end
