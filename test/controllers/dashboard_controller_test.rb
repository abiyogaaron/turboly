require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get dashboard_login_url
    assert_response :success
  end

end
