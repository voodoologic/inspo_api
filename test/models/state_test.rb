require 'test_helper'

class StateTest < ActiveSupport::TestCase
  test "State" do
    state = State.new
    assert_respond_to state, :name
    assert_respond_to state, :districts

  end
end
