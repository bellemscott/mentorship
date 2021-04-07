require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user_menteetrue = User.new(firstname: "belle", lastname: "scott", email: "belle@example.com", password: "123456", mentee: true, mentor: false)
    @user_mentortrue= User.new(firstname: "belle", lastname: "scott", email: "belle1@example.com", password: "123456", mentee: false, mentor: true)
    @user_bothtrue= User.new(firstname: "belle", lastname: "scott", email: "belle2@example.com", password: "123456", mentee: true, mentor: true)
    @user_invalidemail= User.new(firstname: "belle", lastname: "scott", email: "belle3example.com", password: "123456", mentee: true, mentor: false)
    @user_noname= User.new(firstname: "", lastname: "scott", email: "belle3@example.com", password: "123456", mentee: true, mentor: false)
    @user_neithertrue= User.new(firstname: "belle", lastname: "scott", email: "belle4@example.com", password: "123456", mentee: false, mentor: false)
  end

  test "email addresses should be unique" do
    duplicate_user = @user_menteetrue.dup
    duplicate_user.email = @user_menteetrue.email.upcase
    @user_menteetrue.save
    assert_not duplicate_user.valid?
  end

  test "email should not be too long" do      #max length is 50
    @user_menteetrue.email = "a" * 244 + "@example.com"
    assert_not @user_menteetrue.valid?
  end

  test "validity" do
    assert @user_menteetrue.valid?
    assert @user_mentortrue.valid?
    assert @user_bothtrue.valid?
    assert_not @user_invalidemail.valid?
    assert_not @user_noname.valid?
    assert @user_neithertrue.valid?
  end
end
