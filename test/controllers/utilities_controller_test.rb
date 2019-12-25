require 'test_helper'

class UtilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get utilities_new_url
    assert_response :success
  end

  test "should get index" do
    get utilities_index_url
    assert_response :success
  end

  test "should get show" do
    get utilities_show_url
    assert_response :success
  end

end
