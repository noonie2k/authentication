require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :body => "MyString",
      :author_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_body", :name => "post[body]"
      assert_select "input#post_author_id", :name => "post[author_id]"
    end
  end
end
