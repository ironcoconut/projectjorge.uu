require 'test_helper'

class ParentsResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parents_resource = parents_resources(:one)
  end

  test "should get index" do
    get parents_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_parents_resource_url
    assert_response :success
  end

  test "should create parents_resource" do
    assert_difference('ParentsResource.count') do
      post parents_resources_url, params: { parents_resource: { age_max: @parents_resource.age_max, age_min: @parents_resource.age_min, category: @parents_resource.category, link: @parents_resource.link, notes: @parents_resource.notes, price: @parents_resource.price, title: @parents_resource.title } }
    end

    assert_redirected_to parents_resource_url(ParentsResource.last)
  end

  test "should show parents_resource" do
    get parents_resource_url(@parents_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_parents_resource_url(@parents_resource)
    assert_response :success
  end

  test "should update parents_resource" do
    patch parents_resource_url(@parents_resource), params: { parents_resource: { age_max: @parents_resource.age_max, age_min: @parents_resource.age_min, category: @parents_resource.category, link: @parents_resource.link, notes: @parents_resource.notes, price: @parents_resource.price, title: @parents_resource.title } }
    assert_redirected_to parents_resource_url(@parents_resource)
  end

  test "should destroy parents_resource" do
    assert_difference('ParentsResource.count', -1) do
      delete parents_resource_url(@parents_resource)
    end

    assert_redirected_to parents_resources_url
  end
end
