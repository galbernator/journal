require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test 'valid' do
    assert build(:question).valid?
  end

end
