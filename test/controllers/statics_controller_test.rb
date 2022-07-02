require "test_helper"

class StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get terms" do
    get statics_terms_url
    assert_response :success
  end

  test "should get privacy" do
    get statics_privacy_url
    assert_response :success
  end

  test "should get shipping" do
    get statics_shipping_url
    assert_response :success
  end

  test "should get about" do
    get statics_about_url
    assert_response :success
  end
end
