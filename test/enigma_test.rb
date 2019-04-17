require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma'
require './lib/cipher'


class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @today = Date.today.strftime("%d%m%y")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_with__key_and_date

    expected = {
                encryption: 'keder ohulw',
                key: '02715',
                date: '040895'
                }

    assert_equal expected, @enigma.encrypt('hello world', '02715', '040895')
  end

  def test_decrypt_with__key_and_date

    expected = {
                encryption: 'hello world',
                key: '02715',
                date: '040895'
                }

    assert_equal expected, @enigma.decrypt('keder ohulw', '02715', '040895')
  end

  def test_encrypt_hash_date_today_if_no_date_given
    assert_equal @today, @enigma.encrypt('hello world')[:date]
  end

  def test_encrypt_hash_key_rand_if_no_key_given
    expected = {
                encryption: 'keder ohulw',
                key: '00457',
                date: @today
                }

    assert @enigma.encrypt('hello world')[:key].to_i.integer?
    assert_equal 5, @enigma.encrypt('hello world')[:key].length
    assert_equal String, @enigma.encrypt('hello world')[:key].class
  end

  def test_decrypt
    expected = {
                decryption: 'hello world',
                key: '42640',
                date: '160419'
                }

    assert_equal expected, @enigma.decrypt('aiazhdlbkpt', '42640', '160419')
  end

end
