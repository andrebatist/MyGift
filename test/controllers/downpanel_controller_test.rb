require 'test_helper'

class DownpanelControllerTest < ActionController::TestCase
  test "should get chekoutinf" do
    get :chekoutinf
    assert_response :success
  end

  test "should get payinf" do
    get :payinf
    assert_response :success
  end

  test "should get shipinf" do
    get :shipinf
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

end
