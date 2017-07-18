#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/character.rb"
require_relative "../lib/movie.rb"

welcome
character = get_character_from_user
show_character_movies(character)
