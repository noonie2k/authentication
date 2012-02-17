require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :body => "MyString",
      :author_id => 1
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_body", :name => "post[body]"
      assert_select "input[type='hidden']#post_author_id", :name => "post[author_id]"
    end
  end
end
