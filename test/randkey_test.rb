require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'
require './lib/cipher'

class RandkeyTest < Minitest::Test

  def setup
    @rand_key = RandKey.new
  end

def test_it_exists
  assert_instance_of RandKey, @rand_key
end

end
