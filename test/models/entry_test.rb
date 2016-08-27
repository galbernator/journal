require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test 'valid' do
    assert build(:entry).valid?
  end

end
