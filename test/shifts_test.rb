# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/shifts'

class ShiftsTest < Minitest::Test

  def setup
    @shifts = Shifts.new('12345', '160419')
  end

  def test_it_exists
    assert_instance_of Shifts, @shifts
  end

  def test_it_has_attributes
    assert_equal '12345', @shifts.key
    assert_equal '160419', @shifts.date
  end

end
