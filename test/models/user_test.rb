require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid" do
    assert build(:user).valid?
  end

end
