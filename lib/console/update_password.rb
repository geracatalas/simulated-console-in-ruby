# frozen_string_literal: true

# Change the password of the current user
def update_password(new_password)
  # Check that the user has permissions
  if $current_user.role == 'read_only'
    puts 'Error: You do not have permission to perform this action'
  # Check that a new password has been entered
  elsif new_password.nil?
    puts 'Error: New password cannot be blank, if you want to delete it, use the delete_password command'
  else
    # Change user's password
    $current_user.password = new_password
  end
end
