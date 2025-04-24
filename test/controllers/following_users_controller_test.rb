require "test_helper"

class FollowingUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @following_user = following_users(:one)
  end

  test "should get index" do
    get following_users_url
    assert_response :success
  end

  test "should get new" do
    get new_following_user_url
    assert_response :success
  end

  test "should create following_user" do
    assert_difference("FollowingUser.count") do
      post following_users_url, params: { following_user: { following_user_id: @following_user.following_user_id, user_id: @following_user.user_id } }
    end

    assert_redirected_to following_user_url(FollowingUser.last)
  end

  test "should show following_user" do
    get following_user_url(@following_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_following_user_url(@following_user)
    assert_response :success
  end

  test "should update following_user" do
    patch following_user_url(@following_user), params: { following_user: { following_user_id: @following_user.following_user_id, user_id: @following_user.user_id } }
    assert_redirected_to following_user_url(@following_user)
  end

  test "should destroy following_user" do
    assert_difference("FollowingUser.count", -1) do
      delete following_user_url(@following_user)
    end

    assert_redirected_to following_users_url
  end
end
