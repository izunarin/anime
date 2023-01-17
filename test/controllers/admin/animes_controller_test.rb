require "test_helper"

class Admin::AnimesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_animes_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_animes_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_animes_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_animes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_animes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_animes_update_url
    assert_response :success
  end
end
