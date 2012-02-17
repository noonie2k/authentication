require 'spec_helper'

describe Post do
  it "must be invalid if there are empty fields" do
    empty_post = Post.new

    empty_post.should_not be_valid
    empty_post.should have(1).errors_on(:body)
    empty_post.should have(1).errors_on(:author_id)
  end
end
