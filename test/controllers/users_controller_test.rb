require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = create(:user)
    sign_in_as create(:user)
  end

  test 'new' do
    get '/users/new'
    assert_response :success
  end

  test 'create invalid' do
    post '/users', params: { user: params(:invalid) }
    assert_response :success
  end

  test 'create valid' do
    post '/users', params: { user: params }
    assert_response :redirect
  end

  test 'show' do
    get "/users/#{@user.id}"
    assert_response :success
  end

  test 'edit' do
    get "/users/#{@user.id}/edit"
    assert_response :success
  end

  test 'update invalid' do
    patch "/users/#{@user.id}", params: { user: params(:invalid) }
    assert_response :success
  end

  test 'update valid' do
    patch "/users/#{@user.id}", params: { user: params }
    assert_response :redirect
  end

  private

  def params(kind = :valid)
    case kind
    when :invalid
      {
        first_name: '',
        last_name: '',
        email: '',
        password: '',
        password_confirmation: ''
      }
    when :valid
      {
        first_name: 'Billy',
        last_name: 'Billerson',
        email: 'billy@billerson.com',
        password: 'Pa55w0rd',
        password_confirmation: 'Pa55w0rd'
      }
    end
  end

end
