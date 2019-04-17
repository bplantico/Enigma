require './lib/enigma'
require './lib/cipher'

message, decrypted, key, date = ARGV

message_1 = File.open(message, "r")
decrypted_1 = File.open(decrypted, "w")

decrypted_message = Enigma.new.decrypt(message_1.read, key, date)
decrypted_1.write(decrypted_message[:decryption])
decrypted_1.close

p "Created #{decrypted} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}."
