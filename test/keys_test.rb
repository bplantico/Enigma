require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'
require './lib/keys'

class KeysTest < Minitest::Test

  def setup
    @keys = Keys.new
  end

  def test_it_exists
    assert_instance_of Keys, @keys
  end

  def test_seed_number_is_an_integer
    assert_equal Integer, @keys.seed_number.class
  end

  def test_seed_becomes_five_char_string
    assert_equal 5, @keys.seed_string.length
  end

end
