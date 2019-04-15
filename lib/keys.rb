class Keys

  def seed_number
    rand(0..99999)
  end

  def seed_string
    seed_string = seed_number.to_s
    until seed_string.length == 5
      seed_string = "0" + "#{seed_string}"
    end
    seed_string
  end

  

end
