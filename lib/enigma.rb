require 'date'

class Enigma

  def encrypt(message, key, date = Date.today.strftime("%d%m%y"))
    encryption_hash = {
                    encryption: nil,
                    key: key,
                    date: date
    }
  end

end
