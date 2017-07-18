require 'rest-client'
require 'json'
require 'pry'

def get_movies_from_api(movies_urls)
  movies = movies_urls.collect do |movie_url|
    call_api(movie_url)
  end
  movies
end

def parse_character_movies(films_hash)
  films_hash.collect.with_index do |film, index|
    puts "#{index + 1}. #{film["title"]} (Episode #{film["episode_id"]})"
  end
end

def show_character_movies(character)
  character_result = get_character_movies_from_api(character)

  if character_result != nil
    return parse_character_movies(character_result)
  end

  puts "Character not found"
end
