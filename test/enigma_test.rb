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

  def test_it_generates_seed_number
    assert_instance_of Integer, @enigma.seed_number
  end

  def test_key_method_returns_two_char_string
    assert_equal 2, @enigma.key('A').length
    assert_equal String, @enigma.key('A').class
  end

  def test_key_method_returns_same_key_if_called_twice
    assert @enigma.key('a') == @enigma.key('A')
    assert @enigma.key('B') == @enigma.key('B')
    assert @enigma.key('C') == @enigma.key('c')
    assert @enigma.key('d') == @enigma.key('d')
  end

  def test_case_name

  end

end
