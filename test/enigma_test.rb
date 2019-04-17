# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'
require './lib/cipher'
require './lib/shifts'
require './lib/rand_key'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @today = Date.today.strftime("%d%m%y")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_with_key_and_date

    expected = {
                encryption: 'keder ohulw!',
                key: '02715',
                date: '040895'
                }

    assert_equal expected, @enigma.encrypt('hello world!', '02715', '040895')
  end

  def test_decrypt_with_key_and_date

    expected = {
                decryption: 'hello world!',
                key: '02715',
                date: '040895'
                }

    assert_equal expected, @enigma.decrypt('keder ohulw!', '02715', '040895')
  end

  def test_encrypt_message_with_key_only

    expected = {
                encryption: 'ojhavesdyq ',
                key: '02715',
                date: '160419'
                }

    assert_equal expected, @enigma.encrypt('hello world', '02715')
  end

  def test_decrypt_message_with_key_only

    expected = {
                decryption: 'hello world',
                key: '02715',
                date: '160419'
                }

    assert_equal expected, @enigma.decrypt('ojhavesdyq ', '02715')
  end

  def test_encrypt_hash_key_rand_if_no_key_given
    expected = {
                encryption: 'ojhavesdyq ',
                key: '00457',
                date: @today
                }

    assert @enigma.encrypt('hello world')[:key].to_i.integer?
    assert_equal 5, @enigma.encrypt('hello world')[:key].length
    assert_equal String, @enigma.encrypt('hello world')[:key].class
  end

end
