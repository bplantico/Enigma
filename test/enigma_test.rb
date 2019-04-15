require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'



class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_method_returns_hash

    expected = {
                encryption: nil,
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_method_returns_today_if_no_date_given

    expected = {
                encryption: nil,
                key: "02715",
                date: "150419"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

end
