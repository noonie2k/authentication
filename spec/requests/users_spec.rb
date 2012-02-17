require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "should redirect to login url if user is not logged in" do
      user = create_user

      get users_path
      response.should redirect_to login_path
    end
  end
end
