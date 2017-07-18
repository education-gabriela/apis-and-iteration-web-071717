require 'rest-client'
require 'json'
require 'pry'

def call_api(url = "http://www.swapi.co/api/people/")
  response = RestClient.get(url)
  JSON.parse(response)
end
