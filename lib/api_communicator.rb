require 'rest-client'
require 'json'
require 'pry'

# Calls the REST API
def call_api(url = "http://www.swapi.co/api/people/")
  response = RestClient.get(url)
  JSON.parse(response)
end
