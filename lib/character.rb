require 'rest-client'
require 'json'
require 'pry'

# Gets movies recursively through the next_url method
def get_character_movies_from_api(character)
  next_url = "http://www.swapi.co/api/people/"

  while next_url != nil
    films_hash = call_api(next_url)
    next_url = films_hash["next"]

    character_result = get_character(films_hash["results"], character)
    if character_result
      return get_movies_from_api(character_result["films"])
    end
  end

  nil
end

# Goes trough a array of character hashes and find matching name
def get_character(characters_group, search_term)
  characters_group.find do |character|
    character["name"].start_with?(search_term)
  end
end
