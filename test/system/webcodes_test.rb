require "application_system_test_case"

class WebcodesTest < ApplicationSystemTestCase
  setup do
    @webcode = webcodes(:one)
  end

  test "visiting the index" do
    visit webcodes_url
    assert_selector "h1", text: "Webcodes"
  end

  test "creating a Webcode" do
    visit webcodes_url
    click_on "New Webcode"

    fill_in "Bottom l", with: @webcode.bottom_l
    fill_in "Bottom m", with: @webcode.bottom_m
    fill_in "Bottom r", with: @webcode.bottom_r
    click_on "Create Webcode"

    assert_text "Webcode was successfully created"
    click_on "Back"
  end

  test "updating a Webcode" do
    visit webcodes_url
    click_on "Edit", match: :first

    fill_in "Bottom l", with: @webcode.bottom_l
    fill_in "Bottom m", with: @webcode.bottom_m
    fill_in "Bottom r", with: @webcode.bottom_r
    click_on "Update Webcode"

    assert_text "Webcode was successfully updated"
    click_on "Back"
  end

  test "destroying a Webcode" do
    visit webcodes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Webcode was successfully destroyed"
  end
end
