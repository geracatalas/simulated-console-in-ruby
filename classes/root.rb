# frozen_string_literal: true

# Root class is used to create the main directory and also to store user accounts
class Root < Folder
  def initialize(name, parent_folder)
    super(name, parent_folder)
    # Stores the user accounts
    @users = {}
  end

  attr_reader :users

  # Create a user
  def add_user(user)
    # Check that a user with that username does not already exist
    if @users.key? user.username
      puts "Error: Username \"#{user.username}\" is already in use"
    else
      @users[user.username] = user
    end
  end
end
