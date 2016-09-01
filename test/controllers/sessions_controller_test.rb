require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test 'new' do
    get '/login'
    assert_response :success
  end

  test 'redirects to root if already logged in' do
    @user = create(:user)
    sign_in_as @user
    get '/login'
    assert_redirected_to :root
  end

  test 'logout' do
    @user = create(:user)
    sign_in_as @user
    delete '/logout'
    assert_redirected_to :login
  end

end
