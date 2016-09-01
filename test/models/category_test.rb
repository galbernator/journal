require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test 'valid' do
    assert build(:category).valid?
  end

end
