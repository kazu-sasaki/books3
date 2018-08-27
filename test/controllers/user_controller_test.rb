require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_index_url
    assert_response :success
  end

  test "should get about" do
    get user_about_url
    assert_response :success
  end

  test "should get top" do
    get user_top_url
    assert_response :success
  end

  test "should get edit" do
    get user_edit_url
    assert_response :success
  end

  test "should get show" do
    get user_show_url
    assert_response :success
  end

end
