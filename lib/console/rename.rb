# frozen_string_literal: true

# Rename a folder or file
def rename(current_name, new_name)
  # Check that the user has permissions
  if $current_user.role == 'read_only'
    puts 'Error: You do not have permission to perform this action'
  # Check that a file or folder name has been entered
  elsif current_name.nil?
    puts 'Error: File or folder name cannot be blank'
  # Check that a new file name has been entered
  elsif new_name.nil?
    puts 'Error: New file or folder name cannot be blank'
  # Show an error if the new name is equal to the current one
  elsif current_name == new_name
    puts 'Error: New name must be different from the current one'
  # Check that the new name is not the same as an existing one
  elsif ($current_folder.files.key? new_name) || ($current_folder.folders.key? new_name)
    puts "Error: A file or folder with the name \"#{new_name}\" already exists"
  # Rename the file if it exists
  elsif $current_folder.files.key?(current_name)
    $current_folder.files[current_name].name = new_name
    $current_folder.add_file($current_folder.files[current_name])
    $current_folder.files.delete(current_name)
  # Rename the folder if it exists
  elsif $current_folder.folders.key?(current_name)
    $current_folder.folders[current_name].name = new_name
    $current_folder.add_folder($current_folder.folders[current_name])
    $current_folder.folders.delete(current_name)
  else
    # Show an error if the file or folder does not exist
    puts "Error: File or folder \"#{current_name}\" does not exist"
  end
end
