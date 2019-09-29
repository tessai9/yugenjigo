require 'test_helper'

class DeclareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create declare" do
    @new_declare = Declare.new do |declaration|
      declaration.uid = "1"
      declaration.declare = "test"
    end
    @new_declare.save
    assert_instance_of User, @new_declare
  end
end
