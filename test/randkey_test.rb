require './test/test_helper'

class RandkeyTest < Minitest::Test

  def setup
    @rand_key = RandKey.new
  end

  def test_it_exists
    assert_instance_of RandKey, @rand_key
  end

  def test_it_initializes_with_a_seed_number_as_integer
    assert @rand_key.seed_number.integer?
  end

  def test_it_initializes_with_a_seed_number_between_1_and_5_chars
    assert @rand_key.seed_number.to_s.length >= 1
    assert @rand_key.seed_number.to_s.length <= 5
  end

  def test_as_string_method_turns_seed_number_into_string
    assert_equal String, @rand_key.as_string.class
  end

end
