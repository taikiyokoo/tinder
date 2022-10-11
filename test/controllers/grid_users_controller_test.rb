require 'test_helper'

class GridUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get grid_users_index_url
    assert_response :success
  end

  test "should get show" do
    get grid_users_show_url
    assert_response :success
  end

end
