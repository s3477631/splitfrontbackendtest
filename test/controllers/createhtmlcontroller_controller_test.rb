require 'test_helper'

class CreatehtmlcontrollerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get createhtmlcontroller_create_url
    assert_response :success
  end

  test "should get new" do
    get createhtmlcontroller_new_url
    assert_response :success
  end

  test "should get show" do
    get createhtmlcontroller_show_url
    assert_response :success
  end

end
