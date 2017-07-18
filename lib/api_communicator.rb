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
  movies
end



def get_character_movies_from_api(character)
  next_url = "http://www.swapi.co/api/people/"

  while next_url != nil
    films_hash = call_api(next_url)
    next_url = films_hash["next"]
  
    character_result = get_character(films_hash["results"], character)
    if character_result
      puts "Name: #{character_result["name"]}"
      movies = get_movies_from_api(character_result["films"])
      return parse_character_movies(movies)
    end
  end

  "Character not found"
end

def parse_character_movies(films_hash)
  films_hash.collect.with_index do |film, index|
    puts "#{index + 1}. #{film["title"]} (Episode #{film["episode_id"]})" 
  end
end

def show_character_movies(character)
  get_character_movies_from_api(character)
end

def get_character(movies, search_term)
  movies.find do |character|
    character["name"].start_with?(search_term)
  end
end

