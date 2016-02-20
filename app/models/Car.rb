class Car

  def initialize(make, year)
    @lightsOn = false
    @make = make
    @year = year
  end

  def make
    @make
  end

  def year
    @year
  end

  # def lightsOff
  #   @lightsOn = false
  # end

  def lightsValue(value)
    @lightsOn = value
  end

  def lightsOn?
    if @lightsOn == "off"
      "The lights are off"
    else
      "The lights are on"
    end
  end



end #end of class
