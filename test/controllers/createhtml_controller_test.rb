require 'test_helper'

class CreatehtmlControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get createhtml_create_url
    assert_response :success
  end

  test "should get new" do
    get createhtml_new_url
    assert_response :success
  end

  test "should get show" do
    get createhtml_show_url
    assert_response :success
  end

end
