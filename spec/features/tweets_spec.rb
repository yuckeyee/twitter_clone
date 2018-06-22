require 'rails_helper'

RSpec.feature 'Tweets', type: :feature do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }

  scenario 'user creates a new tweet' do
    login_as user, scope: :user
    visit root_path

    expect {
      fill_in 'tweet_content', with: 'Trying out Capybara'
      click_button 'ツイート'
      expect(page).to have_content '投稿しました'
    }.to change(user.tweets, :count).by(1)
  end

  scenario 'user can not creates a new tweet without content' do
    login_as user, scope: :user
    visit root_path

    expect {
      click_button 'ツイート'
      expect(page).to have_content '投稿に失敗しました'
    }.not_to change(user.tweets, :count)
  end

  scenario 'user delete a tweet' do
    create(:tweet, user: user)
    login_as user, scope: :user
    visit root_path

    expect {
      click_link '削除'
      expect(page).to have_content '削除しました'
    }.to change(user.tweets, :count).by(-1)
  end

  scenario 'feed on root' do
    create(:tweet, content: 'user', user: user)
    create(:tweet, content: 'user2', user: user2)
    create(:tweet, content: 'user3', user: user3)
    user.follow!(user2)
    login_as user, scope: :user
    visit root_path

    expect(page).to have_content 'user'
    expect(page).to have_content 'user2'
    expect(page).to have_no_content 'user3'
  end
end
