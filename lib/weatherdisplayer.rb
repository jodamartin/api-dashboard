class WeatherDisplayer
  require 'uri'
  require 'net/http'
  require 'json'
  require 'dotenv'
  attr_reader :city, :state, :temperature, :weather, :url

  def initialize(city, state)
    @city = city
    @state = state
    @temperature = ''
    @weather = ''
    @key = ENV['KEY']
    @url_string = "http://api.wunderground.com/api/c1b0c1c05588980a/conditions/q/#{@state}/#{@city}.json"
    @url = URI(@url_string)
  end

  def get_weather
    response = Net::HTTP.get(@url)
    info = JSON.parse(response)
    @temperature = info['current_observation']['temp_f']
    @weather = info['current_observation']['weather']
  end
end
