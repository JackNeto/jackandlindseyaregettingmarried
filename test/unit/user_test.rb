require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:default_user)
  end

  # def test_should_invite_friends
  #   assert_difference 'User.count', 2 do
  #     # Note: First email is repeated twice, so the method should remove duplicates. The last email is invalid.
  #     completed, failed = @user.invite_friends(["friend1@test.test", "friend1@test.test", "friend2@test.test", "invalid_email"])
  #     assert_equal ["friend1@test.test", "friend2@test.test"], completed
  #     assert_equal ["invalid_email"], failed
  #   end
  # end
  
end
