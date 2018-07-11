require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "Person" do
    person = Person.new
    assert_respond_to person, :roles
    assert_respond_to person, :district
    assert_respond_to person, :state
  end
end
