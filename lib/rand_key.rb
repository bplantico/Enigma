class RandKey
  attr_reader :seed_number

  def initialize
    @seed_number = rand(0..99999)
  end

  def as_string
    @seed_number.to_s.rjust(5, "0")
  end

end
  
