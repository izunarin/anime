require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_index_url
    assert_response :success
  end

  test "should get withdraw" do
    get admin_users_withdraw_url
    assert_response :success
  end
end
