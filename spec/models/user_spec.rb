require 'spec_helper'

describe User do
  it "must not be valid if fields are empty" do
    user = User.new

    user.should_not be_valid
    user.should have(1).errors_on(:email)
    user.should have(1).errors_on(:password_digest)
  end
end
