require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:user) { create(:user) }

  it "is valid with a content" do
    tweet = build(:tweet, user: user)
    expect(tweet).to be_valid
  end

  it "is invalid without a content" do
    tweet = build(:tweet, content: nil)
    tweet.valid?
    expect(tweet.errors[:content]).to include("が記入されていません。")
  end
end
