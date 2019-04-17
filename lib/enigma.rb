require_relative './rand_key'
require_relative './cipher'
require_relative './shifts'
require 'date'

class Enigma
  attr_reader :rand_key

  def initialize
    @rand_key     = RandKey.new
    @todays_date  = Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key = @rand_key.as_string, date = @todays_date)
    shifts = Shifts.new(key, date)
    cipher = Cipher.new(message, shifts.shifts)
    hash = {encryption: cipher.encrypted_string, key: key, date: date}
  end

  def decrypt(message, key, date = @todays_date)
    shifts = Shifts.new(key, date)
    cipher = Cipher.new(message, shifts.shifts)
    hash = {decryption: cipher.decrypted_string, key: key, date: date}
  end

end
