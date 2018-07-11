require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "Role" do
    role = Role.new
    assert_respond_to role, :persons
    assert_respond_to role, :type
  end
end
