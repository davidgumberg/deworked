require "test_helper"

class DateStringSafeTest < ActiveSupport::TestCase
  include DatesHelper
  test "returns N/A when date is nil" do
    assert_equal('N/A', date_string_safe(nil))
  end

  test "returns \"%m/%d/%Y\" when given a date" do
    date = Date.new(1997, 4, 25)
    assert_equal('04/25/1997', date_string_safe(date))
  end
end
