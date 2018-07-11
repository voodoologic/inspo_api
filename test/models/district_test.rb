require 'test_helper'

class DistrictTest < ActiveSupport::TestCase
  test "District" do
    district = District.new
    assert_respond_to district, :state
    assert_respond_to district, :people
  end
end
