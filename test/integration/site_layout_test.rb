require 'test_helper'
# integration tests are for layout links

# This was created by hand with $ rails g integration_test site_layout
# rails generator appends _test to the end of the file name

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # Our plan for testing the layout links involves checking the HTML structure of our site:
  
  test "layout_links" do
  	get root_path
  	assert_template 'static_pages/home' # do we need the static_page portion here?
  	assert_select "a[href=?]", root_path, count: 2
  	assert_select "a[href=?]", help_path
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", contact_path
  	assert_select "a[href=?]", signup_path
  	get signup_path
  	assert_select "title", "Sign Up | Ruby on Rails Tutorial Sample App"
  end
end



# Some notes:
# While assert_select is flexible and powerful (having many more options than the ones shown here), experience shows 
# that it’s wise to take a lightweight approach by testing only HTML elements (such as site layout links) that are 
# unlikely to change much over time.