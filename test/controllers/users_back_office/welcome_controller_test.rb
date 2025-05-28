require "test_helper"

class UsersBackOffice::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_back_office_welcome_index_url
    assert_response :success
  end
end
