require "test_helper"

class Users::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_profile_index_url
    assert_response :success
  end
end
