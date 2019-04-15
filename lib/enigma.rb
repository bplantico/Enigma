require 'date'

class Enigma
  attr_reader :seed_number

  def initialize
    @seed_number = rand(0..99999)
  end

  def key(letter)
    seed_string = @seed_number.to_s.rjust(5, "0")
    seed_string_array = seed_string.chars
    a,b,c,d,e = seed_string_array
    return (a + b) if letter.downcase == 'a'
    return (b + c) if letter.downcase == 'b'
    return (c + d) if letter.downcase == 'c'
    return (d + e) if letter.downcase == 'd'
  end

  def encrypt(message, key = @seed_number, date = "150419") # Date.today.strftime("%d%m%y"))

    encryption_hash = {
                    encryption: nil,
                    key: key,
                    date: date
                      }

  end



end
