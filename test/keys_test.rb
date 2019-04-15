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

end
