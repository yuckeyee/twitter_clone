require 'rails_helper'

RSpec.feature "Following", type: :feature do
  scenario 'user toggles a follow in user index page' do
    user = create(:user)
    user2 = create(:user)
    login_as user, scope: :user

    visit users_path
    click_on "フォローする"
    expect(page).to have_button 'フォロー中'
    expect(user.following?(user2)).to be true

    click_on 'フォロー中'
    expect(page).to have_button 'フォローする'
    expect(user.following?(user2)).to be false
  end

  scenario 'user toggles a follow in user show page' do
    user = create(:user)
    user2 = create(:user)
    login_as user, scope: :user

    visit user_path(user2)
    click_on "フォローする"
    expect(page).to have_button 'フォロー中'
    expect(user.following?(user2)).to be true

    click_on 'フォロー中'
    expect(page).to have_button 'フォローする'
    expect(user.following?(user2)).to be false
  end
end
