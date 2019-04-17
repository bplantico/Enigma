class Shifts
  attr_reader :key,
              :date

  def initialize(key, date)
    @key  = key
    @date = date
  end

  def keys
    a_key = @key.chars[0..1].join.to_i
    b_key = @key.chars[1..2].join.to_i
    c_key = @key.chars[2..3].join.to_i
    d_key = @key.chars[3..4].join.to_i
    keys_array = [a_key, b_key, c_key, d_key]
  end

  def offsets
    offset_seed = (@date.to_i ** 2)
    last_four_digits = offset_seed.to_s.chars[offset_seed.to_s.chars.count - 4, 4]
    last_four_digits.map { |digit| digit.to_i }
  end

  def shifts
    shift_seed = offsets.zip(keys)
    shift_seed.map { |seed| seed.sum }
  end

end
