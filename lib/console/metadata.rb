# frozen_string_literal: true

# Show the metadata of a file
def metadata(name)
  # Check that a file name has been entered
  if name.nil?
    puts 'Error: File name cannot be blank'
  # Show metadata if file exists
  elsif $current_folder.files.key? name
    puts $current_folder.files[name].metadata
  else
    # Show an error if the file does not exist
    puts "Error: The file #{name} does not exists"
  end
end
