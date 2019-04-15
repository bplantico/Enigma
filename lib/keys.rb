class Keys

  attr_reader :seed_number

  def initialize
    @seed_number = rand(0..99999)
  end

  def seed_string
    seed_string = @seed_number.to_s.rjust(5, "0")
  end

   def key(letter) # look into each_cons refactor
    seed_string_arry = seed_string.chars
    a, b, c, d, e = seed_string_arry
    return (a + b) if letter == 'a'
    return (b + c) if letter == 'b'
    return (c + d) if letter == 'c'
    return (d + e) if letter == 'd'
  end
end
