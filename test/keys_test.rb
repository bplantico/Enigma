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

  def test_seed_string_becomes_4_two_char_strings
    assert_equal 2, @keys.key('a').length
    assert_equal 2, @keys.key('b').length
    assert_equal 2, @keys.key('c').length
    assert_equal 2, @keys.key('d').length
    assert_nil @keys.key('e')

    assert_equal String, @keys.key('a').class
    assert_equal String, @keys.key('b').class
    assert_equal String, @keys.key('c').class
    assert_equal String, @keys.key('d').class
    assert_nil @keys.key('e')
  end

  def test_keys_dont_change
    assert @keys.key('a') == @keys.key('a')
    assert @keys.key('b') == @keys.key('b')
    assert @keys.key('c') == @keys.key('c')
    assert @keys.key('d') == @keys.key('d')
  end

end
