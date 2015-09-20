require 'test_helper'

class SignupControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select   :title,'SIGN UP'
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
