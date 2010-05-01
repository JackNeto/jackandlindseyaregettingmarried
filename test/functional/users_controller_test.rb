require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  # def setup
  #   @unverified = users(:unverified)
  # end

  def test_get_change_password
    get :change_password, :email_validation_key => users(:verified).email_validation_key
    assert_response :success
    assert_template 'new'
  end
  

  def test_get_dashboard
    login_as :unverified
    get :dashboard
    assert_response :success
    assert_template 'dashboard'
  end

end
