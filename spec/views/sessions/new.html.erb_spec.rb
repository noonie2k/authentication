require 'spec_helper'

describe "sessions/new" do
  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => '/sessions', :method => "post" do
      assert_select "input#email", :name => "user[email]"
      assert_select "input#password", :name => "user[password]"
    end
  end
end
