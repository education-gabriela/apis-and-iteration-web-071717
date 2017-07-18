#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/character.rb"
require_relative "../lib/movie.rb"

welcome
show_help

loop do
  command = get_command_from_user
  execute_command(command)
  exit if command == "exit"
end
