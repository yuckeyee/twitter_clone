require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が記入されていません。")
  end
end
