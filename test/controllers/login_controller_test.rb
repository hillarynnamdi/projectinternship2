require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select :title ,'InvoiceR-Login'
  end

end
