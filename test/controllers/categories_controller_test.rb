require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    setup do
      @category = create(:category)
      sign_in_as create(:user)
    end

    test 'index' do
      get '/categories'
      assert_response :success
    end

    test 'new' do
      get '/categories/new'
      assert_response :success
    end

    test 'create invalid' do
      post '/categories', params: { category: params(:invalid) }
      assert_response :success
    end

    test 'create valid' do
      post '/categories', params: { category: params }
      assert_response :redirect
    end

    test 'edit' do
      get "/categories/#{@category.id}/edit"
      assert_response :success
    end

    test 'update invalid' do
      patch "/categories/#{@category.id}", params: { category: params(:invalid) }
      assert_response :success
    end

    test 'update valid' do
      patch "/categories/#{@category.id}", params: { category: params }
      assert_response :redirect
    end

    test 'destroy' do
      delete "/categories/#{@category.id}"
      assert_response :redirect
    end

    private

    def params(kind = :valid)
      case kind
      when :invalid
        { name: '' }
      when :valid
        { name: 'John Jacob Jingleheimer Schmidt' }
      end
    end
    
end
