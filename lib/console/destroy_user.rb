# frozen_string_literal: true

# Delete a user
def destroy_user(username)
  # Check that the user has permissions and delete the selected user
  if $current_user.role != 'super'
    puts 'Error: You do not have permission to perform this action'
  # Shows an error if you want to delete the users 'sudo' and/or 'default_user'
  elsif %w[sudo default_user].include?(username)
    puts "Error: Users 'sudo' and 'default_user' cannot be deleted"
  # Delete user if exists
  elsif ROOT.users.key?(username)
    ROOT.users.delete(username)
  else
    # Show an error if the file or folder does not exist
    puts "Error: User \"#{username}\" does not exist"
  end
end
