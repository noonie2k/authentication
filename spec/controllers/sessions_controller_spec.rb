require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create' with valid user login" do
    it "should add user_id to the session and redirect to admin url" do
      user = User.create(
        :email => 'e@mail.com',
        :password => 'secret',
        :password_confirmation => 'secret'
      )

      get 'create', :email => user.email, :password => user.password
      session.should include :user_id

      response.should redirect_to '/admin'
    end
  end

  describe "GET 'create' with invalid user login" do
    it "should redirect to login url" do
      user = User.create(
        :email => 'e@mail.com',
        :password => 'secret',
        :password_confirmation => 'secret'
      )

      get 'create', :email => user.email, :password => 'incorrect'
      response.should redirect_to '/login'
    end
  end

  describe "GET 'destroy' when user is not logged in" do
    it "should remove user_id from the session and redirect to welcome url" do
      get 'destroy'
      session.should_not include :user_id
      response.should redirect_to '/'
    end
  end

  describe "GET 'destroy' when user is logged in" do
    it "should remove user_id from the session and redirect to welcome url" do
      session[:user_id] = 123

      get 'destroy'
      session.should_not include :user_id
      response.should redirect_to '/'
    end
  end

end
