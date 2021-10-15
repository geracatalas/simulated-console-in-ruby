# frozen_string_literal: true

# Create a folder
def create_folder(name)
  # Check that the user has permissions
  if $current_user.role == 'read_only'
    puts 'Error: You do not have permission to perform this action'
  # Check that a folder name has been entered
  elsif name.nil?
    puts 'Error: Folder name cannot be blank'
  else
    # Create the folder
    $current_folder.add_folder Folder.new(name, $current_folder)
  end
end
