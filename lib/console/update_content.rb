# frozen_string_literal: true

# Replaces the content of a file with a new one
def update_content(name, content)
  # Check that the user has permissions
  if $current_user.role == 'read_only'
    puts 'Error: You do not have permission to perform this action'
  # Check that a file name has been entered
  elsif name.nil?
    puts 'Error: File name cannot be blank'
  # Replaces file content if file exists
  elsif $current_folder.files.key?(name)
    $current_folder.files[name].content = content
  else
    # Show an error if the file does not exist
    puts "Error: File \"#{name}\" does not exist"
  end
end
