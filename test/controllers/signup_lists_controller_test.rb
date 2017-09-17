require 'test_helper'

class SignupListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signup_list = signup_lists(:one)
  end

  test "should get index" do
    get signup_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_signup_list_url
    assert_response :success
  end

  test "should create signup_list" do
    assert_difference('SignupList.count') do
      post signup_lists_url, params: { signup_list: { email: @signup_list.email, name: @signup_list.name } }
    end

    assert_redirected_to signup_list_url(SignupList.last)
  end

  test "should show signup_list" do
    get signup_list_url(@signup_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_signup_list_url(@signup_list)
    assert_response :success
  end

  test "should update signup_list" do
    patch signup_list_url(@signup_list), params: { signup_list: { email: @signup_list.email, name: @signup_list.name } }
    assert_redirected_to signup_list_url(@signup_list)
  end

  test "should destroy signup_list" do
    assert_difference('SignupList.count', -1) do
      delete signup_list_url(@signup_list)
    end

    assert_redirected_to signup_lists_url
  end
end
