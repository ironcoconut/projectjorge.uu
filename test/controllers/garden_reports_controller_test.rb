require 'test_helper'

class GardenReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @garden_report = garden_reports(:one)
  end

  test "should get index" do
    get garden_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_garden_report_url
    assert_response :success
  end

  test "should create garden_report" do
    assert_difference('GardenReport.count') do
      post garden_reports_url, params: { garden_report: { garden_id: @garden_report.garden_id, notes: @garden_report.notes } }
    end

    assert_redirected_to garden_report_url(GardenReport.last)
  end

  test "should show garden_report" do
    get garden_report_url(@garden_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_garden_report_url(@garden_report)
    assert_response :success
  end

  test "should update garden_report" do
    patch garden_report_url(@garden_report), params: { garden_report: { garden_id: @garden_report.garden_id, notes: @garden_report.notes } }
    assert_redirected_to garden_report_url(@garden_report)
  end

  test "should destroy garden_report" do
    assert_difference('GardenReport.count', -1) do
      delete garden_report_url(@garden_report)
    end

    assert_redirected_to garden_reports_url
  end
end
