require 'test_helper'

class WebcodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webcode = webcodes(:one)
  end

  test "should get index" do
    get webcodes_url
    assert_response :success
  end

  test "should get new" do
    get new_webcode_url
    assert_response :success
  end

  test "should create webcode" do
    assert_difference('Webcode.count') do
      post webcodes_url, params: { webcode: { bottom_l: @webcode.bottom_l, bottom_m: @webcode.bottom_m, bottom_r: @webcode.bottom_r } }
    end

    assert_redirected_to webcode_url(Webcode.last)
  end

  test "should show webcode" do
    get webcode_url(@webcode)
    assert_response :success
  end

  test "should get edit" do
    get edit_webcode_url(@webcode)
    assert_response :success
  end

  test "should update webcode" do
    patch webcode_url(@webcode), params: { webcode: { bottom_l: @webcode.bottom_l, bottom_m: @webcode.bottom_m, bottom_r: @webcode.bottom_r } }
    assert_redirected_to webcode_url(@webcode)
  end

  test "should destroy webcode" do
    assert_difference('Webcode.count', -1) do
      delete webcode_url(@webcode)
    end

    assert_redirected_to webcodes_url
  end
end
