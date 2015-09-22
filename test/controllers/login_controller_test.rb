<<<<<<< HEAD
require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select :title ,'InvoiceR-Login'
  end

end
=======
require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select :title ,'InvoiceR-Login'
  end

end
>>>>>>> 61693db46d311cfaea957361435f88a706f0f4c9
