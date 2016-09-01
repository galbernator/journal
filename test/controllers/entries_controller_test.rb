require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @entry = create(:entry)
    sign_in_as(@user = create(:user))
  end

  test 'index' do
    get "/users/#{@user.id}/entries"
    assert_response :success
  end

  test 'show' do
    get "/users/#{@user.id}/entries/#{@entry.id}"
    assert_response :success
  end

  test 'destroy' do
    delete "/users/#{@user.id}/entries/#{@entry.id}"
    assert_response :redirect
  end

end
