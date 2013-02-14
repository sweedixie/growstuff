require 'spec_helper'

describe "forums/show" do
  before(:each) do
    @forum = assign(:forum, FactoryGirl.create(:forum))
  end

  it "renders attributes" do
    render
    rendered.should contain "Everything about permaculture"
    rendered.should contain @forum.owner.to_s
  end

  it "parses markdown description into html" do
    render
    assert_select "em", "Everything"
  end

  it 'links to new post with the forum id' do
    render
    assert_select "a[href=#{new_post_path(:forum_id => @forum.id)}]"
  end

  it 'has no posts' do
    render
    rendered.should contain "No posts yet"
  end

  it 'shows posts' do
    @post = FactoryGirl.create(:post, :forum => @forum)
    render
    assert_select "table"
    rendered.should contain @post.subject
    rendered.should contain @post.author.to_s
  end
end
