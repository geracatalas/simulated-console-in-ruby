# frozen_string_literal: true

# Create a file
def create_file(name, content)
  # Check that the user has permissions
  if $current_user.role == 'read_only'
    puts 'Error: You do not have permission to perform this action'
  # Check that a file name has been entered. The content can be null.
  elsif name.nil?
    puts 'Error: File name cannot be blank'
  else
    # Create the file
    $current_folder.add_file VirtualFile.new(name, content)
  end
end
