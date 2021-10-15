# frozen_string_literal: true

# Delete a folder or file
def destroy(name)
  # Check that the user has permissions
  if $current_user.role == 'read_only'
    puts 'Error: You do not have permission to perform this action'
  # Check that a file or folder name has been entered
  elsif name.nil?
    puts 'Error: File or folder name cannot be blank'
  # Delete file if exists
  elsif $current_folder.files.key?(name)
    $current_folder.files.delete(name)
  # Delete folder if exists
  elsif $current_folder.folders.key?(name)
    $current_folder.folders.delete(name)
  else
    # Show an error if the file or folder does not exist
    puts "Error: File or folder \"#{name}\" does not exist"
  end
end
