require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    # setup is a special method that is run before every test
  	@base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
  	get root_url
  	assert_response :success
  	# assert_select "title", @base_title # DRY - this is covered in another test
  end

  test "should get home" do
    get home_path # these are helper methods (added by routes.rb?)
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
  	get about_path
  	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
  	get contact_path
  	assert_response :success
  	assert_select "title", "Contact | #{@base_title}"
  end

end
