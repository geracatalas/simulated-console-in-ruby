# frozen_string_literal: true

# Login with a user
def login(username, password)
  @user = ROOT.users[username]
  # Check that a username has been entered
  if username.nil?
    puts 'Error: Username cannot be blank'
  # Check that the username and password are correct
  elsif ROOT.users.key?(username) && (username == @user.username) && (password == @user.password)
    $current_user = @user
  else
    # Shows an error if the username and/or password are not correct
    puts 'Error: Wrong username or password'
  end
end
