class Cipher
  attr_reader :shifts,
              :message,
              :original_alphabet

  def initialize(message, shifts)
    @message           = message.downcase
    @shifts            = shifts
    @original_alphabet = ("a".."z").to_a << " "
  end

  def message_to_chars_arrays
    a_chars = []; b_chars = []; c_chars = []; d_chars = []
    @message.chars.each_with_index do |char, index|
      a_chars << char if (index + 1) % 4 == 1
      b_chars << char if (index + 1) % 4 == 2
      c_chars << char if (index + 1) % 4 == 3
      d_chars << char if (index + 1) % 4 == 0
    end
    arrays = [a_chars, b_chars, c_chars, d_chars]
  end

  def encrypted_array
    new_array = []
    message_to_chars_arrays.each_with_index do |array, index|
      encoded_alphabet = @original_alphabet.rotate(@shifts[index])
      new_array << array.map do |char|
        if @original_alphabet.include?(char)
          char_index = @original_alphabet.index(char)
          encoded_alphabet[char_index]
        else
          char
        end
      end
    end
    new_array
  end

  def encrypted_string
    a,b,c,d = encrypted_array
    a.zip(b).zip(c).zip(d).flatten.compact.join
  end

  def decrypted_array
    new_array = []
    message_to_chars_arrays.each_with_index do |array, index|
      encoded_alphabet = @original_alphabet.rotate(-@shifts[index])
      new_array << array.map do |char|
        if @original_alphabet.include?(char)
          char_index = @original_alphabet.index(char)
          encoded_alphabet[char_index]
        else
          char
        end
      end
    end
    new_array
  end

  def decrypted_string
    a,b,c,d = decrypted_array
    a.zip(b).zip(c).zip(d).flatten.compact.join
  end

end
