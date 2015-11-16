require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup info" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "abc",
                               password_confirmation: "def" }
    end
    assert_template 'users/new'
  end
end
