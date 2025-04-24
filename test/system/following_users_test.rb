require "application_system_test_case"

class FollowingUsersTest < ApplicationSystemTestCase
  setup do
    @following_user = following_users(:one)
  end

  test "visiting the index" do
    visit following_users_url
    assert_selector "h1", text: "Following users"
  end

  test "should create following user" do
    visit following_users_url
    click_on "New following user"

    fill_in "Following user", with: @following_user.following_user_id
    fill_in "User", with: @following_user.user_id
    click_on "Create Following user"

    assert_text "Following user was successfully created"
    click_on "Back"
  end

  test "should update Following user" do
    visit following_user_url(@following_user)
    click_on "Edit this following user", match: :first

    fill_in "Following user", with: @following_user.following_user_id
    fill_in "User", with: @following_user.user_id
    click_on "Update Following user"

    assert_text "Following user was successfully updated"
    click_on "Back"
  end

  test "should destroy Following user" do
    visit following_user_url(@following_user)
    click_on "Destroy this following user", match: :first

    assert_text "Following user was successfully destroyed"
  end
end
