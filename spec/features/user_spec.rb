require 'spec_helper'

feature 'User browsing the website' do
  let(:post) {Post.new(title: "Test Post", content: "test test")}

  context "on homepage" do
    
    it "sees a list of recent posts titles" do
      post.save
      visit root_path
      page.should have_content(post.title)
      # given a user and a list of posts
      # user visits the homepage
      # user can see the posts titles
    end

    it "can click on titles of recent posts and should be on the post show page" do
      post.save
      visit root_path
      click_link post.title

      current_path.should == post_path(post)
      page.should have_content(post.content)
      # given a user and a list of posts
      # user visits the homepage
      # when a user can clicks on a post title they should be on the post show page
    end
  end

  context "post show page" do
    it "sees title and body of the post" do
      post.save
      visit post_url(post)

      page.should have_content(post.title + " " + post.content)

      # given a user and post(s)
      # user visits the post show page
      # user should see the post title
      # user should see the post body
    end
  end
end
