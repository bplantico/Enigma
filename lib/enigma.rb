require 'date'

class Enigma

  def encrypt(message, key, offset = Date.today.strftime("%d%m%y"))
    encryption_hash = {
                    encryption: nil,
                    key: key,
                    date: offset
    }
  end

end
