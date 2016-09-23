require 'test_helper'

class UserQuestionTest < ActiveSupport::TestCase

  test 'valid' do
    assert build(:user_question).valid?
  end
end
