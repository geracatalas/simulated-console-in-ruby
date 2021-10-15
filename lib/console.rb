# frozen_string_literal: true

require 'readline'
Dir["#{File.dirname(__FILE__)}/console/**/*.rb"].sort.each { |file| require file }

# Keeps the program running until the "exit" command is entered
def console
  loop do
    command = Readline.readline("#{$current_folder.folder_path}>", true)
    # Split the entered string into multiple strings
    # Words separated by spaces are considered as different strings
    # Words inside quotes are considered as a single string.
    # NOTE: ->I got this regular expression on stackoverflow because i don't know how to write it xD<-
    command = command.scan(/(?:["'](?:\\.|[^["']])*["']|[^["'] ])+/)

    # Remove the quotes from each string inside the "command" array
    command = command.map { |x| remove_string_quotes(x) }

    # The first element of the array is considered a command, the rest would be considered as arguments
    case command[0]

    # Move user from one directory to another
    when 'cd'
      if command.length > 2
        puts 'Usage: cd'
        puts 'Usage: cd ..'
        puts 'Usage: cd folder_name'
      else
        cd(command[1])
      end

    # Create a file
    when 'create_file'
      if command.length > 3
        puts 'Usage: create_file file_name'
        puts 'Usage: create_file file_name file_content'
      else
        create_file(command[1], command[2])
        save_if_persists
      end

    # Create a folder
    when 'create_folder'
      if command.length > 2
        puts 'Usage: create_folder folder_name'
      else
        create_folder(command[1])
        save_if_persists
      end

    # Create a user
    when 'create_user'
      if command.length > 4
        puts 'Usage: create_user username'
        puts 'Usage: create_user username password'
        puts 'Usage: create_user username -role=role'
        puts 'Usage: create_user username password -role=role'
        puts "Available roles: 'super', 'regular' and 'read_only'"
        puts "By default the empty role sets 'regular' as the role for the new user"
      else
        create_user(command[1], command[2], command[3])
        save_if_persists
      end

    # Delete the user's password
    when 'delete_password'
      if command.length > 1
        puts 'Usage: delete_password'
      else
        delete_password
        save_if_persists
      end

    # Delete a user
    when 'destroy_user'
      if command.length > 2
        puts 'Usage: destroy_user username'
      else
        destroy_user(command[1])
        save_if_persists
      end

    # Delete a folder or file
    when 'destroy'
      if command.length > 2
        puts 'Usage: destroy file_or_folder_name'
      else
        destroy(command[1])
        save_if_persists
      end

    # Close the program
    when 'exit'
      if command.length > 1
        puts 'Usage: exit'
      else
        exit
      end

    # Login with a user
    when 'login'
      if command.length > 3
        puts 'Usage: login username password'
      else
        login(command[1], command[2])
      end

    # Logout the user
    when 'logout'
      if command.length > 1
        puts 'Usage: logout'
      else
        logout
      end

    # Shows the folders and files available within the folder
    when 'ls'
      if command.length > 1
        puts 'Usage: ls'
      else
        ls
      end

    # Show the metadata of a file
    when 'metadata'
      if command.length > 2
        puts 'Usage: metadata file_name'
      else
        metadata(command[1])
      end

    # Rename a folder or file
    when 'rename'
      if command.length > 3
        puts 'Usage: rename current_file_or_folder_name new_name'
      else
        rename(command[1], command[2])
        save_if_persists
      end

    # Show file content
    when 'show'
      if command.length > 2
        puts 'Usage: show file_name'
      else
        show(command[1])
      end

    # Quick access to login with sudo user
    # It is an alias of 'login sudo password'
    when 'sudo'
      if command.length > 2
        puts 'Usage: sudo password'
      else
        login('sudo', command[1])
      end

    # Replaces the content of a file with a new one
    when 'update_content'
      if command.length > 3
        puts 'Usage: update_content file_name new_content'
        puts 'Empty new_content removes content from file'
      else
        update_content(command[1], command[2])
        save_if_persists
      end

    # Change the password of the current user
    when 'update_password'
      if command.length > 2
        puts 'Usage: update_password new_password'
      else
        update_password(command[1])
        save_if_persists
      end

    # Show directory path
    when 'whereami'
      if command.length > 1
        puts 'Usage: whereami'
      else
        whereami
      end

    # Show current user info
    when 'whoami'
      if command.length > 1
        puts 'Usage: whoami'
      else
        whoami
      end

    # Show an error if the command does not exist
    else
      puts 'Error: Command not found'
    end
  end
end
