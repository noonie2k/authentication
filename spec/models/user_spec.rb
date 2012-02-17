require 'spec_helper'

describe "A User (in general)" do
  before(:each) do
    @user = User.create(
      :email                 => 'user1@domain1.com',
      :password              => 'secret',
      :password_confirmation => 'secret'
    )
  end

  it "must not be valid if fields are empty" do
    user = User.new

    user.should_not be_valid
    user.should have(1).errors_on(:email)
    user.should have(1).errors_on(:password_digest)
  end

  it "must have a unique email" do
    user = User.new
    user.email = @user.email
    user.should_not be_valid
    user.should have(1).errors_on(:email)
  end
end
