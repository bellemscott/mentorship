require "test_helper"

class FlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Welcome to Brandeis Mentorship"
  end

  test "can login" do
    get "/login"
    assert_equal 200, status
    ashley = User.new(firstname: "ashley", lastname: "rogers", email: "ashley@gmail.com", password: "tester", mentor: true)
    post "/login", params: { session: {email: ashley.email,
        password: ashley.password } }
    assert_equal 200, status
  end
end