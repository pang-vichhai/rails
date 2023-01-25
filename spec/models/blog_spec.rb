require 'rails_helper'

RSpec.describe Blog, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "tests article to be object" do
    # blog = Blog.create({title: 'First Blog', content:'this is our first blog', slug:'this is our first blog'})
    blog = FactoryBot.create(:blog)
    expect(blog.title).to eq ('Sample Title')
  end
end
