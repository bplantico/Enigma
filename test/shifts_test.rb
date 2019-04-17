require 'simplecov'
SimpleCov.start
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

  def test_keys_array_has_four_elements
    assert_equal 4, @shifts.keys.count
  end

  def test_keys_array_elements_are_integers
    assert @shifts.keys[0].integer?
    assert @shifts.keys[1].integer?
    assert @shifts.keys[2].integer?
    assert @shifts.keys[3].integer?
  end

  def test_offsets_returns_four_offsets_that_are_integers
    assert_equal 4, @shifts.offsets.count
    assert @shifts.offsets[0].integer?
    assert @shifts.offsets[1].integer?
    assert @shifts.offsets[2].integer?
    assert @shifts.offsets[3].integer?
  end

  def test_shifts_method_returns_four_shifts_that_are_integers
    assert_equal 4, @shifts.shifts.count
    assert @shifts.shifts[0].integer?
    assert @shifts.shifts[1].integer?
    assert @shifts.shifts[2].integer?
    assert @shifts.shifts[3].integer?
  end

end
