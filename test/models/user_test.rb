require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user model test" do
    assert_equal true, User.from_omniauth({ :provider => "twitter", :uid => "123456" }).persisted?
  end
end
