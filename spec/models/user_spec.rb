require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) {
    create(:user, name: 'Bob', profile: 'first')
  }
  let!(:user2) {
    create(:user, name: 'John', profile: 'second')
  }
  let!(:user3) {
    create(:user, name: 'Alisa', profile: 'third')
  }

  it 'is valid with a name' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without a name' do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('が記入されていません。')
  end

  it 'is invalid without a name' do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('が記入されていません。')
  end

  describe 'search users by a keyword' do
    context 'when a match is found' do
      it 'returns users that match the search name' do
        expect(User.search('Bob')).to include(user1)
      end
    end

    context 'when a match is found' do
      it 'returns users that match the search profile' do
        expect(User.search('second')).to include(user2)
      end
    end

    context 'when no match is found' do
      it 'returns an empty collection' do
        expect(User.search('test')).to be_empty
      end
    end

    context 'when no match is found' do
      it 'returns an empty collection' do
        expect(User.search('')).to include(user1, user2, user3)
      end
    end
  end

  describe '#follow, #unfollow, #following?' do
    context 'when user1 follow user2' do
      it 'returns true that use following? method' do
        user1.follow(user2)
        expect(user1.following?(user2)).to be true
        expect(user2.followers.include?(user1)).to be true
      end
    end

    context 'when user1 unfollow user2' do
      it 'returns false that use following? method' do
        user1.follow(user2)
        user1.unfollow(user2)
        expect(user1.following?(user2)).to be false
        expect(user2.followers.include?(user1)).to be false
      end
    end
  end

  describe '#feed' do
    let!(:tweet1) {
      create(:tweet, user: user1)
    }
    let!(:tweet2) {
      create(:tweet, user: user2)
    }
    let!(:tweet3) {
      create(:tweet, user: user3)
    }

    context 'when user1 follow user2' do
      it 'user1 feed contain user2 tweet' do
        user1.follow(user2)
        expect(user1.feed.include?(tweet2)).to be true
      end
      it 'user1 feed contain myself tweet' do
        user1.follow(user2)
        expect(user1.feed.include?(tweet1)).to be true
      end
      it 'user1 feed not contain user3 tweet' do
        user1.follow(user2)
        expect(user1.feed.include?(tweet3)).to be false
      end
    end
  end
end
