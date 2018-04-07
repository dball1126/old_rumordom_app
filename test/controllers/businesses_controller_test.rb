require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get businesses_new_url
    assert_response :success
  end

end
