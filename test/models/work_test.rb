require "test_helper"

class WorkTest < ActiveSupport::TestCase
  test "should not save work without title" do
    work = Work.new
    assert_not work.save
  end

  test "should save work with title" do
    work = Work.new(title: 'Extended Testing Regimes')
    assert work.save
  end
end
