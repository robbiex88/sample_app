require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "test user", email: "test123@aol.com", password: "testing999", password_confirmation: "testing999")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  # # # # # # # # # # # #
  # name field testing  #
  # # # # # # # # # # # #
  test "name should be present" do
    # appears to be the same as assert_not @user2.valid?
    @user.name = ""
    assert_not @user.valid?  
  end

  test "name length requirement" do
    # minimum bound
    @user.name = "a" * 2
    assert_not @user.valid?
    # maximum bound
    @user.name = "a" * 26
    assert_not @user.valid?
  end

  # # # # # # # # # # # #
  # email field testing #
  # # # # # # # # # # # #

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email length requirement" do
    # minimum bound
    @user.email = "a" * 4
    assert_not @user.valid?
    # maximum bound
    @user.email = "a" * 26
    assert_not @user.valid?
  end

  test "email should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |addy|
      @user.email = addy
      assert @user.valid?, "#{addy.inspect} should be valid." # this optional argument to the assert method identifies the email address which fails
    end
  end  

  test "email should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |addy|
      @user.email = addy
      assert_not @user.valid?, "#{addy.inspect} should be invalid."
    end
  end

  test "email should be unique" do
    duplicate_user  = @user.dup
    duplicate_user.email = @user.email.downcase # ToDo: Refactor
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email address should be saved as lower case" do
    mixed_case_email = "FoO@ExAmPLE.COm"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  # # # # # # # # # # # #
  # paswd field testing #
  # # # # # # # # # # # #

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do 
    # Let's make the minimum 6 chatacters
    @user.password = @user.password_confirmation = "a" * 4
    assert_not @user.valid?
  end

  test "password should have a maximum length" do
    # and make the maximum 10 characters
    @user.password = @user.password_confirmation = "a" * 11
    assert_not @user.valid?
  end
  # test "password and confirmation should be equal"
  #   assert_equal @user.password, @user.password_confirmation
  # end

end
