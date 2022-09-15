require "test_helper"

class Posts::RelatedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_related_index_url
    assert_response :success
  end
end
