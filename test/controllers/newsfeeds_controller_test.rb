require 'test_helper'

class NewsfeedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get newsfeeds_new_url
    assert_response :success
  end

  test "should get create" do
    get newsfeeds_create_url
    assert_response :success
  end

  test "should get edit" do
    get newsfeeds_edit_url
    assert_response :success
  end

  test "should get update" do
    get newsfeeds_update_url
    assert_response :success
  end

  test "should get destroy" do
    get newsfeeds_destroy_url
    assert_response :success
  end

end
