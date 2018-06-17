require 'rails_helper'

RSpec.describe User, type: :model do

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
    let!(:user1) {
      create(:user, name: 'Bob', profile: 'first')
    }
    let!(:user2) {
      create(:user, name: 'John', profile: 'second')
    }
    let!(:user3) {
      create(:user, name: 'Alisa', profile: 'third')
    }

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
    let!(:user1) {
      create(:user)
    }
    let!(:user2) {
      create(:user)
    }

    context 'when user1 follow user2' do
      it 'returns true that use following? method' do
        user1.follow(user2)
        expect(user1.following?(user2)).to be true
      end
    end

    context 'when user1 unfollow user2' do
      it 'returns false that use following? method' do
        user1.follow(user2)
        user1.unfollow(user2)
        expect(user1.following?(user2)).to be false
      end
    end
  end

end
