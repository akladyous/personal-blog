require "test_helper"

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_index_url
    assert_response :success
  end

  test "should get show" do
    get contact_show_url
    assert_response :success
  end
end
