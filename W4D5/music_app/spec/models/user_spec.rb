require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do
    FactoryBot.build(:user,
      email: "user@www.com",
      password: "password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "creates digest when password given" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "sets new session token on user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      # Miniscule chance this will fail.
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "verifies password correct" do
      expect(user.is_password?("good_password")).to be true
    end

    it "verifies password not correct" do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user good credentials" do
      expect(User.find_by_credentials("user@www.com", "password")).to eq(user)
    end

    it "returns nil bad credentials" do
      expect(User.find_by_credentials("user@www.com", "bad_password")).to eq(nil)
    end
  end
end
