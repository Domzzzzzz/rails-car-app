class CarController < ApplicationController

  #define my_auto which is referenced
  #in the route to the welcome page
  #and renders the welcome page
  def my_auto
    render "my_auto.html.erb"
  end

  #define status which is referenced

  #in the route to the status page
  #and renders the status page
  def status
    retrieve_car
    render "status.html.erb"
  end

  #saves the car object into a cookie and redirects to the status page
  def make
    if (!params.has_key?(:make) || params[:make].strip.empty? || !params.has_key?(:year) || params[:year].strip.empty?)
      render "make"
    else
      @car = Car.new(params[:make], params[:year])
      session[:car] = @car.to_yaml
      redirect_to "/car/status"
    end
  end

  def lights
    retrieve_car
    @car.lightsValue(params[:lights])
    store_car
    redirect_to "/car/status"
  end

  # if @car.lightsOn == false
  #   @lightsOn = "Lights are Off"
  # else
  #   @lightsOn = "Lights are On"
  # end

  # My private method to get hold of the car we are using
  def retrieve_car
    @car = YAML.load(session[:car])
  end

  def store_car
    session[:car] = @car.to_yaml
  end

end #end of class
