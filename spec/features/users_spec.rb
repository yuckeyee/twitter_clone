require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "visit user index" do
    user = create(:user)
    login_as user, scope: :user

    create_list(:user, 5)
    visit users_path

    expect(page).to have_selector('.list-group-item', count: 8)
  end
end
