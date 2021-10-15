# frozen_string_literal: true

# Show file content
def show(name)
  # Check that a file name has been entered
  if name.nil?
    puts 'Error: File name cannot be blank'
  # Show file content if file exists
  elsif $current_folder.files.key? name
    puts $current_folder.files[name].content
  else
    # Show an error if the file does not exist
    puts "Error: The file #{name} does not exists"
  end
end
