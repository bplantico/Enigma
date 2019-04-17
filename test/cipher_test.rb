# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/shifts'
require './lib/cipher'

class CipherTest < Minitest::Test

  def setup
    @shifts = Shifts.new('12345', '160419')
    @cipher = Cipher.new('HEllo woRLd!', @shifts.shifts)
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_initializes_with_attributes
    assert_equal 'hello world!', @cipher.message
    assert_equal [17, 28, 40, 46], @cipher.shifts
    assert_equal 27, @cipher.original_alphabet.count
  end

  def test_message_turns_into_chars_arrays
    assert @cipher.message.length == @cipher.message_to_chars_arrays.flatten.count
  end

  def test_message_to_chars_arrays_hold_arrays_of_strings
    assert_equal Array, @cipher.message_to_chars_arrays.class
    assert_equal String, @cipher.message_to_chars_arrays[0][0].class

    assert @cipher.message_to_chars_arrays[0].uniq.count >= 1
    assert @cipher.message_to_chars_arrays[1].uniq.count >= 1
    assert @cipher.message_to_chars_arrays[2].uniq.count >= 1
    assert @cipher.message_to_chars_arrays[3].uniq .count>= 1
  end

  def test_encrypted_array_method
    assert_equal Array, @cipher.encrypted_array.class
  end

  def test_encrypted_string_same_length_as_message_and_is_a_string
    assert_equal 12, @cipher.encrypted_string.length
    assert_equal String, @cipher.encrypted_string.class
  end

  def test_decrypted_array_method
    assert_equal Array, @cipher.decrypted_array.class
  end

  def test_decrypted_string_same_length_as_message_and_is_a_string
    assert_equal 12, @cipher.decrypted_string.length
    assert_equal String, @cipher.decrypted_string.class
  end

end
