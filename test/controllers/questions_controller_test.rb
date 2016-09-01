require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @question = create(:question)
    @category = create(:category)
    sign_in_as create(:user)
  end

  test 'index' do
    get '/questions'
    assert_response :success
  end

  test 'new' do
    get '/questions/new'
    assert_response :success
  end

  test 'create invalid' do
    post '/questions', params: { question: params(:invalid) }
    assert_response :success
  end

  test 'create valid' do
    post '/questions', params: { question: params }
    assert_response :redirect
  end

  test 'edit' do
    get "/questions/#{@question.id}/edit"
    assert_response :success
  end

  test 'update invalid' do
    patch "/questions/#{@question.id}", params: { question: params(:invalid) }
    assert_response :success
  end

  test 'update valid' do
    patch "/questions/#{@question.id}", params: { question: params }
    assert_response :redirect
  end

  test 'destroy' do
    delete "/questions/#{@question.id}"
    assert_response :redirect
  end

  private

  def params(kind = :valid)
    case kind
    when :invalid
      {
        text: '',
        category_id: nil
      }
    when :valid
      {
        text: 'Why did the chicken cross the road?',
        category_id: @category.id
      }
    end
  end

end
