require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "should be successful" do
      get posts_path
      response.status.should be(200)
    end
  end

  describe "GET /posts/new" do
    it "should redirect to the login page" do
      get new_post_path
      response.status.should redirect_to login_url
    end
  end
end
