# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/shifts'
require './lib/cipher'

class CipherTest < Minitest::Test

  def setup
    @shifts = Shifts.new('12345', '160419')
    @cipher = Cipher.new('hello world!', @shifts)
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

end
