require "test_helper"

class Public::AnimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_animes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_animes_show_url
    assert_response :success
  end
end
