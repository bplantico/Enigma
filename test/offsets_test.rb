require 'minitest/autorun'
require 'minitest/emoji'
require './lib/offsets'

class KeysTest < Minitest::Test

  def setup
    @offsets = Offsets.new
  end

  def test_it_exists
    assert_instance_of Offsets, @offsets
  end

end
