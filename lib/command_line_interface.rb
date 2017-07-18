def welcome
  puts "Welcome to the Star Wars Search API!"
  puts "Type help to see available commands"
end

def get_command_from_user
  puts "Type your command: "
  input = gets.chomp
end

def get_character_from_user
  puts "please enter a character:"
  input = gets.chomp
end

def execute_command(command)
  case command
  when "help"
    show_help
  when "character"
    character = get_character_from_user
    show_character_movies(character)
  else
    get_command_from_user
  end
end

def show_help
  puts "The available commands are:
  - help: show the list of commands
  - movie: get a movie by episode number
  - character: get movies done by character
  - exit: exits this program"
end
