# frozen_string_literal: true

# Delete the user's password
def delete_password
  # Check that the user has permissions
  if $current_user.role == 'read_only'
    puts 'Error: You do not have permission to perform this action'
  else
    # Delete the user's password
    $current_user.password = nil
  end
end
