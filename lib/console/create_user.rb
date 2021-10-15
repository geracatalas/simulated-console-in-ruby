# frozen_string_literal: true

# Create a user
def create_user(username, password, role)
  # Check that the user has permissions
  if $current_user.role != 'super'
    puts 'Error: You do not have permission to perform this action'
  # Check that a username has been entered
  elsif username.nil?
    puts 'Error: Username cannot be blank'
  # If only the username was entered, create a user without a password and with a 'regular' role
  elsif password.nil? && role.nil?
    ROOT.add_user User.new(username)
  # Checks that a second argument was entered and that it is a role instead of a password
  elsif password.start_with?('-role=') && role.nil?
    # Use the second argument as role
    role = password.delete_prefix('-role=')
    role = remove_string_quotes(role)
    role = 'regular' if role == ''
    # Check that a valid role has been entered
    if %w[super regular read_only].include?(role)
      ROOT.add_user User.new(username, nil, role)
    else
      # Show valid roles in an error message
      puts "Error: Role can only be 'super', 'regular' or 'read_only'
      If you don't enter a role, 'regular' is set by default"
    end
  # If the role was entered as a second argument, a third argument cannot be entered
  elsif password.start_with?('-role=') && !role.nil?
    puts 'Error: Role must be the last argument'
  # If all the arguments were entered, check that the role is a valid one
  elsif role
    role = role.delete_prefix('-role=')
    role = remove_string_quotes(role)
    role = 'regular' if role == ''
    # Check that a valid role has been entered
    if %w[super regular read_only].include?(role)
      ROOT.add_user User.new(username, password, role)
    else
      # Show valid roles in an error message
      puts "Error: Role can only be 'super', 'regular' or 'read_only'
      If you don't enter a role, 'regular' is set by default"
    end
  # If a role is not entered, create a user with role 'regular'
  else
    ROOT.add_user User.new(username, password)
  end
end
