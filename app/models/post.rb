class Post < ActiveRecord::Base
  has_one :author
  
  validates :body, :author_id, :presence => :true
end
