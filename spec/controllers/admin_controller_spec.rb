require 'spec_helper'

describe AdminController do

  describe "GET 'index'" do
    before(:each) do
      @user = User.create(
        :email => "e@mail.com",
        :password => "secret",
        :password_confirmation => "secret"
      )
    end
  
    it "when not logged in; should redirect to the login url" do
      get 'index'
      response.should redirect_to '/login'
    end

    it "when logged in; should be successful" do
      session[:user_id] = @user.id
      
      get 'index'
      response.should be_success
    end
  end
end
