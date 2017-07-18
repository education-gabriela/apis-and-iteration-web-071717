require 'rest-client'
require 'json'
require 'pry'


def call_api(url = "http://www.swapi.co/api/people/")
  response = RestClient.get(url)
  JSON.parse(response)
end


def get_movies_from_api(movies_urls)
  movies = movies_urls.collect do |movie_url|
    call_api(movie_url)
  end
  puts movies.first
  movies
end



def get_character_movies_from_api(character)
  #make the web request
  next_url = "http://www.swapi.co/api/people/"

  while next_url != nil
    films_hash = call_api(next_url)
    next_url = films_hash["next"]
  
    character_result = get_character(films_hash["results"], character)
    if character_result
      movies = get_movies_from_api(character_result["films"])
      return movies
    end
  end

  "Character not found"

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  get_character_movies_from_api(character)
  # next_url = "http://www.swapi.co/api/people/"

  # while next_url != nil
  #   films_hash = get_character_movies_from_api(character, next_url)
  #   next_url = films_hash["next"]

  #   character_result = get_character(films_hash["results"], character)
  #   if character_result
  #     return character_result
  #   end
  # end

  # "Character not found"
end

def get_character(movies, search_term)
  movies.find do |character|
    character["name"].start_with?(search_term)
  end
end
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
