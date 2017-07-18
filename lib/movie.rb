require 'rest-client'
require 'json'
require 'pry'

# Calls the movie API and return movie collection
def get_movies_from_api(movies_urls)
  movies = movies_urls.collect do |movie_url|
    call_api(movie_url)
  end
  movies
end

# Parses movies to a pretty print
def parse_movies(films_hash)
  if films_hash.class == Hash
    films_hash = [films_hash]
  end

  films_hash.collect.with_index do |film, index|
    puts "- #{film["title"]} (Episode #{film["episode_id"]})"
  end
end

# Call the search to show movies of an specific character
def show_character_movies(character)
  character_result = get_character_movies_from_api(character)

  if character_result != nil
    return parse_movies(character_result)
  end

  puts "Character not found"
end

# Finds movie per episode_id
def find_movie_by_episode_id(movies, episode_id)
  movies.find do |movie|
    movie["episode_id"] == episode_id
  end
end

# Validates if episode exists
def episode?(episode_id)
  if episode_id < 1 || episode_id > 7
    return false
  end
  true
end

# show_movie when given episode_id
def show_movie(episode_id)
  urls = []
  7.times do |number|
    urls << "http://swapi.co/api/films/#{number + 1}/"
  end

  films_result = get_movies_from_api(urls)
  movie = find_movie_by_episode_id(films_result, episode_id)
  parse_movies(movie)
end
