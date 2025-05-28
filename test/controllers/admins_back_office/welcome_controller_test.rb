require "test_helper"

class AdminsBackOffice::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_back_office_welcome_index_url
    assert_response :success
  end
end
