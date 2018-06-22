require 'rails_helper'

RSpec.feature "Following", type: :feature do
  let(:user) { create(:user) }

  scenario 'user toggles a follow in user index page', js: true do
    create(:user)
    login_as user, scope: :user

    visit users_path
    click_on "フォローする"
    expect(page).to have_button 'フォロー中'

    click_on 'フォロー中'
    expect(page).to have_button 'フォローする'
  end

  scenario 'user toggles a follow in user show page', js: true do
    user2 = create(:user)
    login_as user, scope: :user

    visit user_path(user2)
    click_on "フォローする"
    expect(page).to have_button 'フォロー中'

    click_on 'フォロー中'
    expect(page).to have_button 'フォローする'
  end
end
