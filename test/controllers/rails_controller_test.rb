require "test_helper"

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get g" do
    get rails_g_url
    assert_response :success
  end

  test "should get controller" do
    get rails_controller_url
    assert_response :success
  end

  test "should get admin/genres" do
    get rails_admin/genres_url
    assert_response :success
  end

  test "should get index" do
    get rails_index_url
    assert_response :success
  end

  test "should get show" do
    get rails_show_url
    assert_response :success
  end

  test "should get edit" do
    get rails_edit_url
    assert_response :success
  end

  test "should get update" do
    get rails_update_url
    assert_response :success
  end
end
