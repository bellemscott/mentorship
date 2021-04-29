require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  def setup
  end

  test "setting up" do
    get '/users/login'
    ex_user = User.create(firstname: "billy", lastname: "joe", email: "billyjoe@gmail.com", password: "123456", mentor: "false", mentee:"true")
    log_in ex_user
  end

  test "should get index" do
    get '/matches/home'
    assert_response :success
  end
end
