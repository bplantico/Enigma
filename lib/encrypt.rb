require './lib/enigma'
require './lib/cipher'

message, encrypted = ARGV

message_1 = File.open(message, "r")
encrypted_1 = File.open(encrypted, "w")

encrypted_message = Enigma.new.encrypt(message_1.read)
encrypted_1.write(encrypted_message[:encryption])
encrypted_1.close

p "Created #{encrypted} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}."
