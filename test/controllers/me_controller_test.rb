require "test_helper"

class MeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get me_index_url
    assert_response :success
  end
end
