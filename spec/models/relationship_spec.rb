require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  it 'is valid with follower_id and followed_id' do
    relationship = build(:relationship, follower_id: user1.id, followed_id: user2.id)
    expect(relationship).to be_valid
  end

  it 'is invalid without a follower_id' do
    relationship = build(:relationship, follower_id: nil)
    relationship.valid?
    expect(relationship.errors[:follower_id]).to include('が記入されていません。')
  end

  it 'is invalid without a followed_id' do
    relationship = build(:relationship, followed_id: nil)
    relationship.valid?
    expect(relationship.errors[:followed_id]).to include('が記入されていません。')
  end
end
